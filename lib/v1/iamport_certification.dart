import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portone_flutter/v1/model/certification_data.dart';
import 'package:portone_flutter/v1/model/iamport_validation.dart';
import 'package:portone_flutter/v1/model/url_data.dart';
import 'package:portone_flutter/v1/widget/iamport_error.dart';
import 'package:portone_flutter/v1/widget/iamport_webview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class IamportCertification extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final String userCode;
  final String? tierCode;
  final CertificationData data;
  final callback;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;
  final String? customUserAgent;

  IamportCertification({
    Key? key,
    this.appBar,
    this.initialChild,
    required this.userCode,
    this.tierCode,
    required this.data,
    required this.callback,
    this.gestureRecognizers,
    this.customUserAgent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var redirectUrl = UrlData.redirectUrl;
    if (this.data.mRedirectUrl != null && this.data.mRedirectUrl!.isNotEmpty) {
      redirectUrl = this.data.mRedirectUrl!;
    }

    IamportValidation validation = IamportValidation.fromCertificationData(
      userCode,
      data,
      callback,
    );

    var init = this.tierCode == null
        ? 'IMP.init("${this.userCode}");'
        : 'IMP.agency("${this.userCode}", "${this.tierCode}");';

    if (validation.getIsValid()) {
      return IamportWebView(
        type: ActionType.auth,
        appBar: this.appBar,
        initialChild: this.initialChild,
        gestureRecognizers: this.gestureRecognizers,
        customUserAgent: this.customUserAgent,
        executeJS: (InAppWebViewController controller) {
          controller.evaluateJavascript(
            source:
                '''
            $init
            IMP.certification(${jsonEncode(this.data.toJson())}, function(response) {
              const query = [];
              Object.keys(response).forEach(function(key) {
                query.push(key + "=" + response[key]);
              });
              location.href = "$redirectUrl" + "?" + query.join("&");
            });
          ''',
          );
        },
        useQueryData: (Map<String, String> data) {
          this.callback(data);
        },
        isPaymentOver: (String url) {
          return url.startsWith(redirectUrl);
        },
        // 인증에는 customPGAction 수행할 필요 없음
        customPGAction: (InAppWebViewController controller) {},
      );
    } else {
      return IamportError(ActionType.auth, validation.getErrorMessage());
    }
  }
}
