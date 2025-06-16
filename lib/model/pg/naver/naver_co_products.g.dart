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
      if (instance.id case final value?) 'id': value,
      if (instance.merchantProductId case final value?)
        'merchantProductId': value,
      if (instance.ecMallProductId case final value?) 'ecMallProductId': value,
      if (instance.name case final value?) 'name': value,
      if (instance.basePrice case final value?) 'basePrice': value,
      if (instance.taxType case final value?) 'taxType': value,
      if (instance.quantity case final value?) 'quantity': value,
      if (instance.infoUrl case final value?) 'infoUrl': value,
      if (instance.imageUrl case final value?) 'imageUrl': value,
      if (instance.giftName case final value?) 'giftName': value,
      if (instance.options case final value?) 'options': value,
      if (instance.shipping case final value?) 'shipping': value,
      if (instance.supplements case final value?) 'supplements': value,
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
      if (instance.optionQuantity case final value?) 'optionQuantity': value,
      if (instance.optionPrice case final value?) 'optionPrice': value,
      if (instance.selectionCode case final value?) 'selectionCode': value,
      if (instance.selections case final value?) 'selections': value,
    };

NaverCoOptionItem _$NaverCoOptionItemFromJson(Map<String, dynamic> json) =>
    NaverCoOptionItem(
      code: json['code'] as String?,
      label: json['label'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$NaverCoOptionItemToJson(NaverCoOptionItem instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.label case final value?) 'label': value,
      if (instance.value case final value?) 'value': value,
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
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.price case final value?) 'price': value,
      if (instance.quantity case final value?) 'quantity': value,
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
      if (instance.groupId case final value?) 'groupId': value,
      if (instance.method case final value?) 'method': value,
      if (instance.baseFee case final value?) 'baseFee': value,
      if (instance.feePayType case final value?) 'feePayType': value,
      if (instance.feeRule case final value?) 'feeRule': value,
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
      if (instance.freeByThreshold case final value?) 'freeByThreshold': value,
      if (instance.repeatByQty case final value?) 'repeatByQty': value,
      if (instance.rangesByQty case final value?) 'rangesByQty': value,
      if (instance.surchargesByArea case final value?)
        'surchargesByArea': value,
    };

NaverCoFeeRangeByQty _$NaverCoFeeRangeByQtyFromJson(
        Map<String, dynamic> json) =>
    NaverCoFeeRangeByQty(
      from: (json['from'] as num?)?.toInt(),
      surcharge: (json['surcharge'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NaverCoFeeRangeByQtyToJson(
        NaverCoFeeRangeByQty instance) =>
    <String, dynamic>{
      if (instance.from case final value?) 'from': value,
      if (instance.surcharge case final value?) 'surcharge': value,
    };

NaverCoFeeAreaByQty _$NaverCoFeeAreaByQtyFromJson(Map<String, dynamic> json) =>
    NaverCoFeeAreaByQty(
      from: (json['from'] as List<dynamic>?)?.map((e) => e as String).toList(),
      surcharge: (json['surcharge'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NaverCoFeeAreaByQtyToJson(
        NaverCoFeeAreaByQty instance) =>
    <String, dynamic>{
      if (instance.from case final value?) 'from': value,
      if (instance.surcharge case final value?) 'surcharge': value,
    };
