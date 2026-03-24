import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:portone_flutter/v2/model/request/payment_request.dart';
import 'package:portone_flutter/v2/model/response/payment_response.dart';
import 'package:portone_flutter/v2/widget/portone_webview.dart';

class PortonePayment extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final PaymentRequest data;
  final void Function(PaymentResponse response) callback;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  PortonePayment({
    Key? key,
    this.appBar,
    this.initialChild,
    required this.data,
    required this.callback,
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
          PortOne.requestPayment($params)
            .catch((err) => window.flutter_inappwebview.callHandler("portoneError", err.message));
        ''',
        );
      },
      onComplete: (Map<String, dynamic> responseData) {
        callback(PaymentResponse.fromJson(responseData));
      },
      onError: (String message) {
        callback(
          PaymentResponse(
            transactionType: 'PAYMENT',
            txId: '',
            paymentId: data.paymentId,
            code: 'SDK_ERROR',
            message: message,
          ),
        );
      },
    );
  }
}
