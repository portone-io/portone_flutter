import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PortoneWebView extends StatefulWidget {
  static final String html = '''
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
      </head>
      <body></body>
    </html>
  ''';

  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final ValueSetter<InAppWebViewController> executeJS;
  final void Function(Map<String, dynamic> queryParams) onComplete;
  final void Function(String message) onError;
  final String redirectUrl;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  PortoneWebView({
    this.appBar,
    this.initialChild,
    required this.executeJS,
    required this.onComplete,
    required this.onError,
    required this.redirectUrl,
    this.gestureRecognizers,
  });

  @override
  _PortoneWebViewState createState() => _PortoneWebViewState();
}

class _PortoneWebViewState extends State<PortoneWebView> {
  InAppWebViewController? _webViewController;
  late int _isWebviewLoaded;
  late int _isSDKLoaded;

  @override
  void initState() {
    super.initState();
    _isWebviewLoaded = 0;
    _isSDKLoaded = 0;
    if (widget.initialChild != null) {
      _isWebviewLoaded++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final controller = _webViewController;
        if (controller != null && await controller.canGoBack()) {
          await controller.goBack();
        } else {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        // bugfix: Scroll issue on iOS when focusing on a text field in WebView.
        // Mirror of PR #143 (V1 IamportWebView fix) for V2 PortoneWebView.
        // Without this, virtual keyboard appearance shifts the entire WebView
        // upward causing input field to be hidden behind keyboard accessory bar.
        // See issue #123.
        resizeToAvoidBottomInset: false,
        appBar: widget.appBar,
        body: SafeArea(
          child: IndexedStack(
            index: _isWebviewLoaded,
            children: [
              InAppWebView(
                initialSettings: InAppWebViewSettings(
                  useShouldOverrideUrlLoading: true,
                  resourceCustomSchemes: ["intent"],
                ),
                gestureRecognizers: widget.gestureRecognizers,
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                  controller.addJavaScriptHandler(
                    handlerName: "portoneError",
                    callback: (data) {
                      widget.onError(
                        data.isNotEmpty ? data[0].toString() : 'Unknown error',
                      );
                    },
                  );
                  controller.loadData(
                    data: PortoneWebView.html,
                    baseUrl: WebUri(
                      'https://flutter-sample-content.portone.io/',
                    ),
                  );
                },
                onLoadStop: (controller, url) {
                  if (_isWebviewLoaded == 1) {
                    setState(() {
                      _isWebviewLoaded = 0;
                    });
                  }
                  if (_isSDKLoaded == 0) {
                    widget.executeJS(controller);
                    _isSDKLoaded++;
                  }
                },
                onLoadResourceWithCustomScheme: (controller, resource) async {
                  await controller.stopLoading();
                  return null;
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  final uri = navigationAction.request.url!.rawValue;

                  if (uri.startsWith(widget.redirectUrl)) {
                    final queryParams =
                        navigationAction.request.url!.queryParameters;
                    widget.onComplete(Map<String, dynamic>.from(queryParams));
                    return NavigationActionPolicy.CANCEL;
                  }

                  var colon = uri.indexOf(':');
                  var protocol = uri.substring(0, colon);
                  switch (protocol) {
                    case 'http':
                    case 'https':
                      return NavigationActionPolicy.ALLOW;
                    case 'intent':
                      var firstHash = uri.indexOf('#');
                      String? scheme;
                      for (var param
                          in uri.substring(firstHash + 1).split(';')) {
                        var keyValue = param.split('=');
                        if (keyValue.length >= 2 && keyValue[0] == 'scheme') {
                          scheme = keyValue[1];
                        }
                      }
                      var redirect =
                          '${scheme != null ? '$scheme:' : ''}${uri.substring(colon + 1, firstHash)}';
                      if (await canLaunchUrlString(redirect)) {
                        launchUrlString(redirect);
                      }
                      return NavigationActionPolicy.CANCEL;
                    default:
                      if (await canLaunchUrlString(uri)) {
                        launchUrlString(uri);
                      }
                      return NavigationActionPolicy.CANCEL;
                  }
                },
              ),
              if (_isWebviewLoaded == 1) widget.initialChild!,
            ],
          ),
        ),
      ),
    );
  }
}
