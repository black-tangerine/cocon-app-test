// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String?,
      image_thumbnail_url: json['image_thumbnail_url'] as String?,
      image_medium_url: json['image_medium_url'] as String?,
      image_url: json['image_url'] as String?,
      web_image_thumbnail_url: json['web_image_thumbnail_url'] as String?,
      web_image_medium_url: json['web_image_medium_url'] as String?,
      web_image_url: json['web_image_url'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      sale_price: json['sale_price'] as int?,
      sale_percent: json['sale_percent'] as int?,
      is_sell: json['is_sell'] as bool?,
      is_special_price: json['is_special_price'] as bool?,
      is_new: json['is_new'] as bool?,
      is_free_delivery: json['is_free_delivery'] as bool?,
      is_heart_delivery: json['is_heart_delivery'] as bool?,
      is_today_delivery: json['is_today_delivery'] as bool?,
      bookmark_count: json['bookmark_count'] as int?,
      seller: json['seller'] as Map<String, dynamic>?,
      root_category_no: json['root_category_no'] as String?,
      root_category_name: json['root_category_name'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'image_thumbnail_url': instance.image_thumbnail_url,
      'image_medium_url': instance.image_medium_url,
      'image_url': instance.image_url,
      'web_image_thumbnail_url': instance.web_image_thumbnail_url,
      'web_image_medium_url': instance.web_image_medium_url,
      'web_image_url': instance.web_image_url,
      'name': instance.name,
      'price': instance.price,
      'sale_price': instance.sale_price,
      'sale_percent': instance.sale_percent,
      'is_sell': instance.is_sell,
      'is_special_price': instance.is_special_price,
      'is_new': instance.is_new,
      'is_free_delivery': instance.is_free_delivery,
      'is_heart_delivery': instance.is_heart_delivery,
      'is_today_delivery': instance.is_today_delivery,
      'bookmark_count': instance.bookmark_count,
      'seller': instance.seller,
      'root_category_no': instance.root_category_no,
      'root_category_name': instance.root_category_name,
    };
