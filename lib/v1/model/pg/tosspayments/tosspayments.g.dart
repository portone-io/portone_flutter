// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tosspayments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tosspayments _$TosspaymentsFromJson(Map<String, dynamic> json) => Tosspayments(
  useInternationalCardOnly: json['useInternationalCardOnly'] as bool?,
  discountCode: json['discountCode'] as String?,
);

Map<String, dynamic> _$TosspaymentsToJson(Tosspayments instance) =>
    <String, dynamic>{
      'useInternationalCardOnly': ?instance.useInternationalCardOnly,
      'discountCode': ?instance.discountCode,
    };
