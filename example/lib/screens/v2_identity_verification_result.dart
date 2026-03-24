import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portone_flutter/v2/model/response/identity_verification_response.dart';

class V2IdentityVerificationResult extends StatelessWidget {
  static const Color successColor = Color(0xff52c41a);
  static const Color failureColor = Color(0xfff5222d);

  @override
  Widget build(BuildContext context) {
    IdentityVerificationResponse response =
        Get.arguments as IdentityVerificationResponse;
    bool isSuccess = response.code == null;
    String message;
    IconData icon;
    Color color;
    if (isSuccess) {
      message = '본인인증에 성공하였습니다';
      icon = Icons.check_circle;
      color = successColor;
    } else {
      message = '본인인증에 실패하였습니다';
      icon = Icons.error;
      color = failureColor;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('포트원 V2 본인인증 결과'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 200),
            Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
              child: Column(
                children: [
                  _buildRow('identityVerificationId',
                      response.identityVerificationId),
                  _buildRow('identityVerificationTxId',
                      response.identityVerificationTxId),
                  if (!isSuccess) ...[
                    _buildRow('에러 코드', response.code ?? '-'),
                    _buildRow('에러 메시지', response.message ?? '-'),
                    _buildRow('PG 에러 코드', response.pgCode ?? '-'),
                    _buildRow('PG 에러 메시지', response.pgMessage ?? '-'),
                  ],
                ],
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.offAllNamed('/');
              },
              label: Text(
                '돌아가기',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(label, style: TextStyle(color: Colors.grey)),
          ),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}
