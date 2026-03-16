import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portone_flutter/v2/portone_payment.dart';
import 'package:portone_flutter/v2/model/payment_request.dart';
import 'package:portone_flutter/v2/model/payment_response.dart';

class V2Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentRequest data = Get.arguments['data'] as PaymentRequest;

    return PortonePayment(
      appBar: AppBar(
        title: Text('포트원 V2 결제'),
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
      callback: (PaymentResponse response) {
        Get.offNamed('/v2-payment-result', arguments: response);
      },
    );
  }
}
