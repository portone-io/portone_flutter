import 'package:json_annotation/json_annotation.dart';

part 'identity_verification_request.g.dart';

@JsonSerializable()
class IdentityVerificationRequest {
  String storeId;
  String identityVerificationId;
  String channelKey;
  String? redirectUrl;
  Map<String, dynamic>? customData;
  Map<String, dynamic>? bypass;

  IdentityVerificationRequest({
    required this.storeId,
    required this.identityVerificationId,
    required this.channelKey,
    this.redirectUrl,
    this.customData,
    this.bypass,
  });

  factory IdentityVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$IdentityVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityVerificationRequestToJson(this);
}
