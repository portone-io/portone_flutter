// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificationData _$CertificationDataFromJson(Map<String, dynamic> json) =>
    CertificationData(
      pg: json['pg'] as String?,
      merchantUid: json['merchant_uid'] as String?,
      company: json['company'] as String?,
      carrier: json['carrier'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      minAge: (json['min_age'] as num?)?.toInt(),
      popup: json['popup'] as bool?,
      mRedirectUrl: json['m_redirect_url'] as String?,
    );

Map<String, dynamic> _$CertificationDataToJson(CertificationData instance) =>
    <String, dynamic>{
      'pg': ?instance.pg,
      'merchant_uid': ?instance.merchantUid,
      'company': ?instance.company,
      'carrier': ?instance.carrier,
      'name': ?instance.name,
      'phone': ?instance.phone,
      'min_age': ?instance.minAge,
      'popup': ?instance.popup,
      'm_redirect_url': ?instance.mRedirectUrl,
    };
