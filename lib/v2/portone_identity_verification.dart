import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:portone_flutter/v2/model/request/identity_verification_request.dart';
import 'package:portone_flutter/v2/model/response/identity_verification_response.dart';
import 'package:portone_flutter/v2/widget/portone_webview.dart';

class PortoneIdentityVerification extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final IdentityVerificationRequest data;
  final void Function(IdentityVerificationResponse response) callback;
  final String appScheme;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  PortoneIdentityVerification({
    Key? key,
    this.appBar,
    this.initialChild,
    required this.data,
    required this.callback,
    this.appScheme = 'portone',
    this.gestureRecognizers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final redirectUrl = 'https://portone/complete';
    final json = data.toJson();
    json['redirectUrl'] = redirectUrl;
    json['forceRedirect'] = true;
    final params = jsonEncode(json);

    return PortoneWebView(
      appBar: appBar,
      initialChild: initialChild,
      gestureRecognizers: gestureRecognizers,
      redirectUrl: redirectUrl,
      executeJS: (InAppWebViewController controller) {
        controller.evaluateJavascript(
          source:
              '''
          PortOne.requestIdentityVerification($params)
            .catch((err) => window.flutter_inappwebview.callHandler("portoneError", err.message));
        ''',
        );
      },
      onComplete: (Map<String, dynamic> responseData) {
        callback(IdentityVerificationResponse.fromJson(responseData));
      },
      onError: (String message) {
        callback(
          IdentityVerificationResponse(
            transactionType: 'IDENTITY_VERIFICATION',
            identityVerificationId: data.identityVerificationId,
            identityVerificationTxId: '',
            code: 'SDK_ERROR',
            message: message,
          ),
        );
      },
    );
  }
}
