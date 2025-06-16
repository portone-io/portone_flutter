// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settle _$SettleFromJson(Map<String, dynamic> json) => Settle(
      cashReceiptType: json['criPsblYn'] as String?,
    );

Map<String, dynamic> _$SettleToJson(Settle instance) => <String, dynamic>{
      if (instance.cashReceiptType case final value?) 'criPsblYn': value,
    };
