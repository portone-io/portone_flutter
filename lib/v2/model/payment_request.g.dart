// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      storeId: json['storeId'] as String,
      paymentId: json['paymentId'] as String,
      orderName: json['orderName'] as String,
      totalAmount: json['totalAmount'] as num,
      currency: json['currency'] as String,
      channelKey: json['channelKey'] as String,
      payMethod: json['payMethod'] as String,
      redirectUrl: json['redirectUrl'] as String?,
      customData: json['customData'] as Map<String, dynamic>?,
      bypass: json['bypass'] as Map<String, dynamic>?,
      taxFreeAmount: json['taxFreeAmount'] as num?,
      vatAmount: json['vatAmount'] as num?,
      isEscrow: json['isEscrow'] as bool?,
      customer: json['customer'] as Map<String, dynamic>?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      noticeUrls: (json['noticeUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      confirmUrl: json['confirmUrl'] as String?,
      appScheme: json['appScheme'] as String?,
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'paymentId': instance.paymentId,
      'orderName': instance.orderName,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
      'channelKey': instance.channelKey,
      'payMethod': instance.payMethod,
      'redirectUrl': ?instance.redirectUrl,
      'customData': ?instance.customData,
      'bypass': ?instance.bypass,
      'taxFreeAmount': ?instance.taxFreeAmount,
      'vatAmount': ?instance.vatAmount,
      'isEscrow': ?instance.isEscrow,
      'customer': ?instance.customer,
      'products': ?instance.products,
      'noticeUrls': ?instance.noticeUrls,
      'confirmUrl': ?instance.confirmUrl,
      'appScheme': ?instance.appScheme,
    };
