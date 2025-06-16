// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NaverInterface _$NaverInterfaceFromJson(Map<String, dynamic> json) =>
    NaverInterface(
      cpaInflowCode: json['cpaInflowCode'] as String?,
      naverInflowCode: json['naverInflowCode'] as String?,
      saClickId: json['saClickId'] as String?,
      merchantCustomCode1: json['merchantCustomCode1'] as String?,
      merchantCustomCode2: json['merchantCustomCode2'] as String?,
    );

Map<String, dynamic> _$NaverInterfaceToJson(NaverInterface instance) =>
    <String, dynamic>{
      if (instance.cpaInflowCode case final value?) 'cpaInflowCode': value,
      if (instance.naverInflowCode case final value?) 'naverInflowCode': value,
      if (instance.saClickId case final value?) 'saClickId': value,
      if (instance.merchantCustomCode1 case final value?)
        'merchantCustomCode1': value,
      if (instance.merchantCustomCode2 case final value?)
        'merchantCustomCode2': value,
    };
