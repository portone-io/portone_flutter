import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portone_flutter/v1/model/iamport_url.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum ActionType { auth, payment }

class IamportWebView extends StatefulWidget {
  static final Color primaryColor = Color(0xff344e81);
  static final String html = '''
    <html>
      <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

        <script type="text/javascript" src="https://cdn.iamport.kr/v1/iamport.js"></script>
      </head>
      <body></body>
    </html>
  ''';

  final ActionType type;
  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final ValueSetter<InAppWebViewController> executeJS;
  final ValueSetter<Map<String, String>> useQueryData;
  final Function isPaymentOver;
  final Function customPGAction;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;
  final String? customUserAgent;

  IamportWebView({
    required this.type,
    this.appBar,
    this.initialChild,
    required this.executeJS,
    required this.useQueryData,
    required this.isPaymentOver,
    required this.customPGAction,
    this.gestureRecognizers,
    this.customUserAgent,
  });

  @override
  _IamportWebViewState createState() => _IamportWebViewState();
}

class _IamportWebViewState extends State<IamportWebView> {
  late InAppWebViewController _webViewController;
  StreamSubscription? _sub;
  late int _isWebviewLoaded;
  late int _isImpLoaded;

  @override
  void initState() {
    super.initState();
    _isWebviewLoaded = 0;
    _isImpLoaded = 0;
    if (widget.initialChild != null) {
      _isWebviewLoaded++;
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_sub != null) _sub!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
        child: IndexedStack(
          index: _isWebviewLoaded,
          children: [
            InAppWebView(
              initialData: InAppWebViewInitialData(
                data: IamportWebView.html,
                mimeType: 'text/html',
                encoding: 'utf-8',
              ),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
                mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                thirdPartyCookiesEnabled: true,
                userAgent: widget.customUserAgent ?? null,
              ),
              gestureRecognizers: widget.gestureRecognizers,
              onWebViewCreated: (controller) {
                this._webViewController = controller;
                if (Platform.isIOS) {
                  // safari에서 히스토리가 쌓이지 않아 뒤로가기가 먹통인 현상 해결
                  // 참고: tosspayments_widget_sdk_flutter 2.1.2 lib/webview/payment_window_in_app_webview.dart:82
                  this._webViewController.loadUrl(
                    urlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse('about:blank')),
                    ),
                  );
                }
                this._webViewController.loadUrl(
                  urlRequest: URLRequest(
                    url: WebUri.uri(
                      Uri.parse(
                        Uri.dataFromString(
                          IamportWebView.html,
                          mimeType: 'text/html',
                          encoding: Encoding.getByName('utf-8'),
                        ).toString(),
                      ),
                    ),
                  ),
                );
                if (widget.type == ActionType.payment) {
                  // 스마일페이, 나이스 실시간 계좌이체
                  _sub = widget.customPGAction(this._webViewController);
                }
              },
              onLoadStop: (controller, url) {
                if (url.toString() == 'about:blank') {
                  return;
                }
                // 웹뷰 로딩 완료시에 화면 전환
                if (_isWebviewLoaded == 1) {
                  setState(() {
                    _isWebviewLoaded = 0;
                  });
                }
                // 페이지 로딩 완료시 IMP 코드 실행
                if (_isImpLoaded == 0) {
                  widget.executeJS(this._webViewController);
                  _isImpLoaded++;
                }
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final url = navigationAction.request.url?.toString() ?? '';
                if (widget.isPaymentOver(url)) {
                  String decodedUrl = Uri.decodeComponent(url);
                  widget.useQueryData(Uri.parse(decodedUrl).queryParameters);

                  return NavigationActionPolicy.CANCEL;
                }

                final iamportUrl = IamportUrl(url);
                if (iamportUrl.isAppLink()) {
                  iamportUrl.launchApp();
                  return NavigationActionPolicy.CANCEL;
                }

                return NavigationActionPolicy.ALLOW;
              },
            ),
            if (_isWebviewLoaded == 1) widget.initialChild!,
          ],
        ),
      ),
    );
  }
}
