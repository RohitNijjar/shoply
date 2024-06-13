// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemModelImpl _$$ShoppingItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingItemModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as num,
      unit: json['unit'] as String,
      category: json['category'] as String,
      isBought: json['isBought'] as bool,
    );

Map<String, dynamic> _$$ShoppingItemModelImplToJson(
        _$ShoppingItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'category': instance.category,
      'isBought': instance.isBought,
    };
