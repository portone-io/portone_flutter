import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portone_flutter/v2/model/request/identity_verification_request.dart';

class V2IdentityVerificationTest extends StatefulWidget {
  @override
  _V2IdentityVerificationTestState createState() =>
      _V2IdentityVerificationTestState();
}

class _V2IdentityVerificationTestState
    extends State<V2IdentityVerificationTest> {
  final _formKey = GlobalKey<FormState>();
  late String storeId;
  late String channelKey;
  late String identityVerificationId;
  late String appScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포트원 V2 본인인증 테스트'),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Store ID'),
                validator: (value) =>
                    value!.isEmpty ? 'Store ID는 필수입력입니다' : null,
                initialValue: '',
                onSaved: (String? value) {
                  storeId = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Channel Key'),
                validator: (value) =>
                    value!.isEmpty ? 'Channel Key는 필수입력입니다' : null,
                initialValue: '',
                onSaved: (String? value) {
                  channelKey = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '본인인증 ID'),
                validator: (value) =>
                    value!.isEmpty ? '본인인증 ID는 필수입력입니다' : null,
                initialValue:
                    'identity_${DateTime.now().millisecondsSinceEpoch}',
                onSaved: (String? value) {
                  identityVerificationId = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'App Scheme (선택)'),
                initialValue: 'portone',
                onSaved: (String? value) {
                  appScheme = value ?? 'portone';
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      IdentityVerificationRequest data =
                          IdentityVerificationRequest(
                            storeId: storeId,
                            channelKey: channelKey,
                            identityVerificationId: identityVerificationId,
                          );

                      Get.toNamed(
                        '/v2-identity-verification',
                        arguments: {'data': data, 'appScheme': appScheme},
                      );
                    }
                  },
                  child: Text(
                    '본인인증 하기',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
