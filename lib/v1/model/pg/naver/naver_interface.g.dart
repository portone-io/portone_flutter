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
      'cpaInflowCode': ?instance.cpaInflowCode,
      'naverInflowCode': ?instance.naverInflowCode,
      'saClickId': ?instance.saClickId,
      'merchantCustomCode1': ?instance.merchantCustomCode1,
      'merchantCustomCode2': ?instance.merchantCustomCode2,
    };
