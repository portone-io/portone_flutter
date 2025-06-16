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
          json['display'] as Map<String, dynamic>),
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
          : NaverInterface.fromJson(
              json['naverInterface'] as Map<String, dynamic>),
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
      if (instance.pg case final value?) 'pg': value,
      'pay_method': instance.payMethod,
      if (instance.escrow case final value?) 'escrow': value,
      'merchant_uid': instance.merchantUid,
      if (instance.name case final value?) 'name': value,
      'amount': instance.amount,
      if (instance.customData case final value?) 'custom_data': value,
      if (instance.taxFree case final value?) 'tax_free': value,
      if (instance.vat case final value?) 'vat': value,
      if (instance.currency case final value?) 'currency': value,
      if (instance.language case final value?) 'language': value,
      if (instance.buyerName case final value?) 'buyer_name': value,
      'buyer_tel': instance.buyerTel,
      if (instance.buyerEmail case final value?) 'buyer_email': value,
      if (instance.buyerAddr case final value?) 'buyer_addr': value,
      if (instance.buyerPostcode case final value?) 'buyer_postcode': value,
      if (instance.noticeUrl case final value?) 'notice_url': value,
      if (PaymentData._cardQuotaToJson(instance.cardQuota) case final value?)
        'display': value,
      if (instance.digital case final value?) 'digital': value,
      if (instance.vbankDue case final value?) 'vbank_due': value,
      if (instance.confirmUrl case final value?) 'confirm_url': value,
      if (instance.mRedirectUrl case final value?) 'm_redirect_url': value,
      'app_scheme': instance.appScheme,
      if (instance.bizNum case final value?) 'biz_num': value,
      if (instance.customerId case final value?) 'customer_id': value,
      if (instance.customerUid case final value?) 'customer_uid': value,
      if (instance.popup case final value?) 'popup': value,
      if (instance.naverUseCfm case final value?) 'naverUseCfm': value,
      if (instance.naverPopupMode case final value?) 'naverPopupMode': value,
      if (instance.naverProducts case final value?) 'naverProducts': value,
      if (instance.naverCultureBenefit case final value?)
        'naverCultureBenefit': value,
      if (instance.naverProductCode case final value?)
        'naverProductCode': value,
      if (instance.naverActionType case final value?) 'naverActionType': value,
      if (instance.naverPurchaserName case final value?)
        'naverPurchaserName': value,
      if (instance.naverPurchaserBirthday case final value?)
        'naverPurchaserBirthday': value,
      if (instance.naverChainId case final value?) 'naverChainId': value,
      if (instance.naverMerchantUserKey case final value?)
        'naverMerchantUserKey': value,
      if (instance.naverInterface case final value?) 'naverInterface': value,
      if (instance.period case final value?) 'period': value,
      if (instance.company case final value?) 'company': value,
      if (instance.niceMobileV2 case final value?) 'niceMobileV2': value,
      if (instance.kcpProducts case final value?) 'kcpProducts': value,
      if (instance.bypass case final value?) 'bypass': value,
    };
