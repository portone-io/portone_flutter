// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_co_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NaverCoProducts _$NaverCoProductsFromJson(Map<String, dynamic> json) =>
    NaverCoProducts(
      id: json['id'] as String?,
      merchantProductId: json['merchantProductId'] as String?,
      ecMallProductId: json['ecMallProductId'] as String?,
      name: json['name'] as String?,
      basePrice: (json['basePrice'] as num?)?.toInt(),
      taxType: json['taxType'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      infoUrl: json['infoUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      giftName: json['giftName'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => NaverCoOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipping: json['shipping'] == null
          ? null
          : NaverCoShipping.fromJson(json['shipping'] as Map<String, dynamic>),
      supplements: (json['supplements'] as List<dynamic>?)
          ?.map((e) => NaverCoSupplement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NaverCoProductsToJson(NaverCoProducts instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'merchantProductId': ?instance.merchantProductId,
      'ecMallProductId': ?instance.ecMallProductId,
      'name': ?instance.name,
      'basePrice': ?instance.basePrice,
      'taxType': ?instance.taxType,
      'quantity': ?instance.quantity,
      'infoUrl': ?instance.infoUrl,
      'imageUrl': ?instance.imageUrl,
      'giftName': ?instance.giftName,
      'options': ?instance.options,
      'shipping': ?instance.shipping,
      'supplements': ?instance.supplements,
    };

NaverCoOption _$NaverCoOptionFromJson(Map<String, dynamic> json) =>
    NaverCoOption(
      optionQuantity: (json['optionQuantity'] as num?)?.toInt(),
      optionPrice: (json['optionPrice'] as num?)?.toInt(),
      selectionCode: json['selectionCode'] as String?,
      selections: (json['selections'] as List<dynamic>?)
          ?.map((e) => NaverCoOptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NaverCoOptionToJson(NaverCoOption instance) =>
    <String, dynamic>{
      'optionQuantity': ?instance.optionQuantity,
      'optionPrice': ?instance.optionPrice,
      'selectionCode': ?instance.selectionCode,
      'selections': ?instance.selections,
    };

NaverCoOptionItem _$NaverCoOptionItemFromJson(Map<String, dynamic> json) =>
    NaverCoOptionItem(
      code: json['code'] as String?,
      label: json['label'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$NaverCoOptionItemToJson(NaverCoOptionItem instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'label': ?instance.label,
      'value': ?instance.value,
    };

NaverCoSupplement _$NaverCoSupplementFromJson(Map<String, dynamic> json) =>
    NaverCoSupplement(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NaverCoSupplementToJson(NaverCoSupplement instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'price': ?instance.price,
      'quantity': ?instance.quantity,
    };

NaverCoShipping _$NaverCoShippingFromJson(Map<String, dynamic> json) =>
    NaverCoShipping(
      groupId: json['groupId'] as String?,
      method: json['method'] as String?,
      baseFee: (json['baseFee'] as num?)?.toInt(),
      feePayType: json['feePayType'] as String?,
      feeRule: json['feeRule'] == null
          ? null
          : NaverCoFeeRule.fromJson(json['feeRule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NaverCoShippingToJson(NaverCoShipping instance) =>
    <String, dynamic>{
      'groupId': ?instance.groupId,
      'method': ?instance.method,
      'baseFee': ?instance.baseFee,
      'feePayType': ?instance.feePayType,
      'feeRule': ?instance.feeRule,
    };

NaverCoFeeRule _$NaverCoFeeRuleFromJson(Map<String, dynamic> json) =>
    NaverCoFeeRule(
      freeByThreshold: (json['freeByThreshold'] as num?)?.toInt(),
      repeatByQty: (json['repeatByQty'] as num?)?.toInt(),
      rangesByQty: (json['rangesByQty'] as List<dynamic>?)
          ?.map((e) => NaverCoFeeRangeByQty.fromJson(e as Map<String, dynamic>))
          .toList(),
      surchargesByArea: (json['surchargesByArea'] as List<dynamic>?)
          ?.map((e) => NaverCoFeeAreaByQty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NaverCoFeeRuleToJson(NaverCoFeeRule instance) =>
    <String, dynamic>{
      'freeByThreshold': ?instance.freeByThreshold,
      'repeatByQty': ?instance.repeatByQty,
      'rangesByQty': ?instance.rangesByQty,
      'surchargesByArea': ?instance.surchargesByArea,
    };

NaverCoFeeRangeByQty _$NaverCoFeeRangeByQtyFromJson(
  Map<String, dynamic> json,
) => NaverCoFeeRangeByQty(
  from: (json['from'] as num?)?.toInt(),
  surcharge: (json['surcharge'] as num?)?.toInt(),
);

Map<String, dynamic> _$NaverCoFeeRangeByQtyToJson(
  NaverCoFeeRangeByQty instance,
) => <String, dynamic>{
  'from': ?instance.from,
  'surcharge': ?instance.surcharge,
};

NaverCoFeeAreaByQty _$NaverCoFeeAreaByQtyFromJson(Map<String, dynamic> json) =>
    NaverCoFeeAreaByQty(
      from: (json['from'] as List<dynamic>?)?.map((e) => e as String).toList(),
      surcharge: (json['surcharge'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NaverCoFeeAreaByQtyToJson(
  NaverCoFeeAreaByQty instance,
) => <String, dynamic>{
  'from': ?instance.from,
  'surcharge': ?instance.surcharge,
};
