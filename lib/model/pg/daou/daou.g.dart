// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daou.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daou _$DaouFromJson(Map<String, dynamic> json) => Daou(
      productCode: json['PRODUCTCODE'] as String?,
      cashReceiptFlag: (json['CASHRECEIPTFLAG'] as num).toInt(),
    );

Map<String, dynamic> _$DaouToJson(Daou instance) => <String, dynamic>{
      if (instance.productCode case final value?) 'PRODUCTCODE': value,
      'CASHRECEIPTFLAG': instance.cashReceiptFlag,
    };
