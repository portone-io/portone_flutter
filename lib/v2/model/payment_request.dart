import 'package:json_annotation/json_annotation.dart';

part 'payment_request.g.dart';

@JsonSerializable()
class PaymentRequest {
  String storeId;
  String paymentId;
  String orderName;
  num totalAmount;
  String currency;
  String channelKey;
  String payMethod;
  String? redirectUrl;
  Map<String, dynamic>? customData;
  Map<String, dynamic>? bypass;
  num? taxFreeAmount;
  num? vatAmount;
  bool? isEscrow;
  Map<String, dynamic>? customer;
  List<Map<String, dynamic>>? products;
  List<String>? noticeUrls;
  String? confirmUrl;
  String? appScheme;

  PaymentRequest({
    required this.storeId,
    required this.paymentId,
    required this.orderName,
    required this.totalAmount,
    required this.currency,
    required this.channelKey,
    required this.payMethod,
    this.redirectUrl,
    this.customData,
    this.bypass,
    this.taxFreeAmount,
    this.vatAmount,
    this.isEscrow,
    this.customer,
    this.products,
    this.noticeUrls,
    this.confirmUrl,
    this.appScheme,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}
