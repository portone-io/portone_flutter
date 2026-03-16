// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) => PaymentData(
  pg: json['pg'] as String?,
  payMethod: json['pay_method'] as String,
  escrow: json['escrow'] as bool?,
  merchantUid: json['merchant_uid'] as String,
  name: json['name'] as String?,
  amount: json['amount'] as num,
  customData: (json['custom_data'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  taxFree: (json['tax_free'] as num?)?.toInt(),
  vat: (json['vat'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  language: json['language'] as String?,
  buyerName: json['buyer_name'] as String?,
  buyerTel: json['buyer_tel'] as String,
  buyerEmail: json['buyer_email'] as String?,
  buyerAddr: json['buyer_addr'] as String?,
  buyerPostcode: json['buyer_postcode'] as String?,
  noticeUrl: json['notice_url'] as String?,
  cardQuota: PaymentData._cardQuotaFromJson(
    json['display'] as Map<String, dynamic>,
  ),
  digital: json['digital'] as bool?,
  vbankDue: json['vbank_due'] as String?,
  confirmUrl: json['confirm_url'] as String?,
  mRedirectUrl: json['m_redirect_url'] as String? ?? UrlData.redirectUrl,
  appScheme: json['app_scheme'] as String,
  bizNum: json['biz_num'] as String?,
  customerId: json['customer_id'] as String?,
  customerUid: json['customer_uid'] as String?,
  popup: json['popup'] as bool?,
  naverUseCfm: json['naverUseCfm'] as String?,
  naverPopupMode: json['naverPopupMode'] as bool?,
  naverProducts: (json['naverProducts'] as List<dynamic>?)
      ?.map((e) => NaverProducts.fromJson(e as Map<String, dynamic>))
      .toList(),
  naverCultureBenefit: json['naverCultureBenefit'] as bool?,
  naverProductCode: json['naverProductCode'] as String?,
  naverActionType: json['naverActionType'] as String?,
  naverPurchaserName: json['naverPurchaserName'] as String?,
  naverPurchaserBirthday: json['naverPurchaserBirthday'] as String?,
  naverChainId: json['naverChainId'] as String?,
  naverMerchantUserKey: json['naverMerchantUserKey'] as String?,
  naverInterface: json['naverInterface'] == null
      ? null
      : NaverInterface.fromJson(json['naverInterface'] as Map<String, dynamic>),
  period: (json['period'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  company: json['company'] as String?,
  niceMobileV2: json['niceMobileV2'] as bool?,
  kcpProducts: (json['kcpProducts'] as List<dynamic>?)
      ?.map((e) => KcpProducts.fromJson(e as Map<String, dynamic>))
      .toList(),
  bypass: json['bypass'] == null
      ? null
      : Bypass.fromJson(json['bypass'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentDataToJson(PaymentData instance) =>
    <String, dynamic>{
      'pg': ?instance.pg,
      'pay_method': instance.payMethod,
      'escrow': ?instance.escrow,
      'merchant_uid': instance.merchantUid,
      'name': ?instance.name,
      'amount': instance.amount,
      'custom_data': ?instance.customData,
      'tax_free': ?instance.taxFree,
      'vat': ?instance.vat,
      'currency': ?instance.currency,
      'language': ?instance.language,
      'buyer_name': ?instance.buyerName,
      'buyer_tel': instance.buyerTel,
      'buyer_email': ?instance.buyerEmail,
      'buyer_addr': ?instance.buyerAddr,
      'buyer_postcode': ?instance.buyerPostcode,
      'notice_url': ?instance.noticeUrl,
      'display': ?PaymentData._cardQuotaToJson(instance.cardQuota),
      'digital': ?instance.digital,
      'vbank_due': ?instance.vbankDue,
      'confirm_url': ?instance.confirmUrl,
      'm_redirect_url': ?instance.mRedirectUrl,
      'app_scheme': instance.appScheme,
      'biz_num': ?instance.bizNum,
      'customer_id': ?instance.customerId,
      'customer_uid': ?instance.customerUid,
      'popup': ?instance.popup,
      'naverUseCfm': ?instance.naverUseCfm,
      'naverPopupMode': ?instance.naverPopupMode,
      'naverProducts': ?instance.naverProducts,
      'naverCultureBenefit': ?instance.naverCultureBenefit,
      'naverProductCode': ?instance.naverProductCode,
      'naverActionType': ?instance.naverActionType,
      'naverPurchaserName': ?instance.naverPurchaserName,
      'naverPurchaserBirthday': ?instance.naverPurchaserBirthday,
      'naverChainId': ?instance.naverChainId,
      'naverMerchantUserKey': ?instance.naverMerchantUserKey,
      'naverInterface': ?instance.naverInterface,
      'period': ?instance.period,
      'company': ?instance.company,
      'niceMobileV2': ?instance.niceMobileV2,
      'kcpProducts': ?instance.kcpProducts,
      'bypass': ?instance.bypass,
    };
