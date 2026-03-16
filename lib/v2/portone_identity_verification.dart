import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:portone_flutter/v2/model/identity_verification_request.dart';
import 'package:portone_flutter/v2/model/payment_response.dart';
import 'package:portone_flutter/v2/widget/portone_webview.dart';

class PortoneIdentityVerification extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final IdentityVerificationRequest data;
  final void Function(PaymentResponse response) callback;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  PortoneIdentityVerification({
    Key? key,
    this.appBar,
    this.initialChild,
    required this.data,
    required this.callback,
    this.gestureRecognizers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.redirectUrl == null || data.redirectUrl!.isEmpty) {
      data.redirectUrl = 'portone://complete';
    }

    final redirectUri = Uri.parse(data.redirectUrl!);
    final redirectScheme = redirectUri.scheme;
    final params = jsonEncode(data.toJson());

    return PortoneWebView(
      appBar: appBar,
      initialChild: initialChild,
      gestureRecognizers: gestureRecognizers,
      redirectScheme: redirectScheme,
      executeJS: (InAppWebViewController controller) {
        controller.evaluateJavascript(source: '''
          PortOne.requestIdentityVerification($params)
            .catch((err) => window.flutter_inappwebview.callHandler("portoneError", err.message));
        ''');
      },
      onResult: (PaymentResponse response) {
        callback(response);
      },
    );
  }
}
