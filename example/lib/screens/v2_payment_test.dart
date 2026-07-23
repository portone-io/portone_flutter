import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portone_flutter/v2/model/request/payment_request.dart';
import 'package:portone_flutter/v2/model/entity/payment_pay_method.dart';
import 'package:portone_flutter/v2/model/entity/currency.dart';
import 'package:portone_flutter/v2/model/entity/customer.dart';

class V2PaymentTest extends StatefulWidget {
  @override
  _V2PaymentTestState createState() => _V2PaymentTestState();
}

class _V2PaymentTestState extends State<V2PaymentTest> {
  final _formKey = GlobalKey<FormState>();
  late String storeId;
  late String channelKey;
  PaymentPayMethod payMethod = PaymentPayMethod.CARD;
  late String orderName;
  late String amount;
  late String paymentId;
  late String appScheme;
  String? customerFullName;
  String? customerPhoneNumber;
  String? customerEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포트원 V2 결제 테스트'),
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
              DropdownButtonFormField<PaymentPayMethod>(
                decoration: InputDecoration(labelText: '결제수단'),
                initialValue: payMethod,
                onChanged: (PaymentPayMethod? value) {
                  setState(() {
                    payMethod = value!;
                  });
                },
                items: PaymentPayMethod.values
                    .map<DropdownMenuItem<PaymentPayMethod>>((
                      PaymentPayMethod value,
                    ) {
                      return DropdownMenuItem<PaymentPayMethod>(
                        value: value,
                        child: Text(value.name),
                      );
                    })
                    .toList(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '주문명'),
                initialValue: '포트원 V2 테스트 결제',
                validator: (value) => value!.isEmpty ? '주문명은 필수입력입니다' : null,
                onSaved: (String? value) {
                  orderName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '결제금액'),
                initialValue: '1000',
                validator: (value) {
                  if (value!.isEmpty) return '결제금액은 필수입력입니다.';
                  RegExp regex = RegExp(r'^\d+$');
                  if (!regex.hasMatch(value)) return '결제금액이 올바르지 않습니다.';
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  amount = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '주문번호 (paymentId)'),
                validator: (value) => value!.isEmpty ? '주문번호는 필수입력입니다' : null,
                initialValue:
                    'payment_${DateTime.now().millisecondsSinceEpoch}',
                onSaved: (String? value) {
                  paymentId = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '구매자 이름 (선택)'),
                initialValue: '',
                onSaved: (String? value) {
                  customerFullName = value!.isEmpty ? null : value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '구매자 휴대전화 번호 (선택)'),
                initialValue: '',
                keyboardType: TextInputType.phone,
                onSaved: (String? value) {
                  customerPhoneNumber = value!.isEmpty ? null : value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '구매자 이메일 (선택)'),
                initialValue: '',
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? value) {
                  customerEmail = value!.isEmpty ? null : value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'App Scheme'),
                validator: (value) =>
                    value!.isEmpty ? 'App Scheme은 필수입력입니다' : null,
                initialValue: 'portone',
                onSaved: (String? value) {
                  appScheme = value!;
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Customer? customer;
                      if (customerFullName != null ||
                          customerPhoneNumber != null ||
                          customerEmail != null) {
                        customer = Customer(
                          fullName: customerFullName,
                          phoneNumber: customerPhoneNumber,
                          email: customerEmail,
                        );
                      }

                      PaymentRequest data = PaymentRequest(
                        storeId: storeId,
                        channelKey: channelKey,
                        payMethod: payMethod,
                        orderName: orderName,
                        totalAmount: int.parse(amount),
                        currency: Currency.KRW,
                        paymentId: paymentId,
                        appScheme: appScheme,
                        customer: customer,
                      );

                      Get.toNamed('/v2-payment', arguments: {'data': data});
                    }
                  },
                  child: Text(
                    '결제하기',
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
