// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityVerificationRequest _$IdentityVerificationRequestFromJson(
  Map<String, dynamic> json,
) => IdentityVerificationRequest(
  storeId: json['storeId'] as String,
  identityVerificationId: json['identityVerificationId'] as String,
  channelKey: json['channelKey'] as String,
  redirectUrl: json['redirectUrl'] as String?,
  customData: json['customData'] as Map<String, dynamic>?,
  bypass: json['bypass'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$IdentityVerificationRequestToJson(
  IdentityVerificationRequest instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'identityVerificationId': instance.identityVerificationId,
  'channelKey': instance.channelKey,
  'redirectUrl': ?instance.redirectUrl,
  'customData': ?instance.customData,
  'bypass': ?instance.bypass,
};
