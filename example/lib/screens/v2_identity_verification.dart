import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portone_flutter/v2/portone_identity_verification.dart';
import 'package:portone_flutter/v2/model/request/identity_verification_request.dart';
import 'package:portone_flutter/v2/model/response/identity_verification_response.dart';

class V2IdentityVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IdentityVerificationRequest data =
        Get.arguments['data'] as IdentityVerificationRequest;
    String appScheme = Get.arguments['appScheme'] as String? ?? 'portone';

    return PortoneIdentityVerification(
      appBar: AppBar(
        title: Text('포트원 V2 본인인증'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      data: data,
      appScheme: appScheme,
      callback: (IdentityVerificationResponse response) {
        Get.offNamed('/v2-identity-verification-result', arguments: response);
      },
    );
  }
}
