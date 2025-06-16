// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bypass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bypass _$BypassFromJson(Map<String, dynamic> json) => Bypass(
      isCulturalExpense: json['isCulturalExpense'] as bool?,
      cashReceiptType: json['cashReceiptType'] as String?,
      acceptMethod: json['acceptmethod'] as String?,
      pReserved: json['P_RESERVED'] as String?,
      daou: json['daou'] == null
          ? null
          : Daou.fromJson(json['daou'] as Map<String, dynamic>),
      tosspayments: json['tosspayments'] == null
          ? null
          : Tosspayments.fromJson(json['tosspayments'] as Map<String, dynamic>),
      settle: json['settle'] == null
          ? null
          : Settle.fromJson(json['settle'] as Map<String, dynamic>),
      danal: json['danal'] == null
          ? null
          : Danal.fromJson(json['danal'] as Map<String, dynamic>),
      tossBrandPayment: json['toss_brandpay'] == null
          ? null
          : TossBrandPayment.fromJson(
              json['toss_brandpay'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BypassToJson(Bypass instance) => <String, dynamic>{
      if (instance.isCulturalExpense case final value?)
        'isCulturalExpense': value,
      if (instance.cashReceiptType case final value?) 'cashReceiptType': value,
      if (instance.acceptMethod case final value?) 'acceptmethod': value,
      if (instance.pReserved case final value?) 'P_RESERVED': value,
      if (instance.daou case final value?) 'daou': value,
      if (instance.tosspayments case final value?) 'tosspayments': value,
      if (instance.settle case final value?) 'settle': value,
      if (instance.danal case final value?) 'danal': value,
      if (instance.tossBrandPayment case final value?) 'toss_brandpay': value,
    };
