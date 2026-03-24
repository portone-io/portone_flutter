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
);

Map<String, dynamic> _$BypassToJson(Bypass instance) => <String, dynamic>{
  'isCulturalExpense': ?instance.isCulturalExpense,
  'cashReceiptType': ?instance.cashReceiptType,
  'acceptmethod': ?instance.acceptMethod,
  'P_RESERVED': ?instance.pReserved,
  'daou': ?instance.daou,
  'tosspayments': ?instance.tosspayments,
  'settle': ?instance.settle,
  'danal': ?instance.danal,
};
