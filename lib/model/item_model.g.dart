// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String?,
      imageThumbnailUrl: json['imageThumbnailUrl'] as String?,
      imageMediumUrl: json['imageMediumUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      webImageThumbnailUrl: json['webImageThumbnailUrl'] as String?,
      webImageMediumUrl: json['webImageMediumUrl'] as String?,
      webImageUrl: json['webImageUrl'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      salePrice: json['salePrice'] as int?,
      salePercent: json['salePercent'] as int?,
      isSell: json['isSell'] as bool?,
      isSpecialPrice: json['isSpecialPrice'] as bool?,
      isNew: json['isNew'] as bool?,
      isFreeDelivery: json['isFreeDelivery'] as bool?,
      isHeartDelivery: json['isHeartDelivery'] as bool?,
      isTodayDelivery: json['isTodayDelivery'] as bool?,
      bookmarkCount: json['bookmarkCount'] as int?,
      seller: json['seller'] as Map<String, dynamic>?,
      rootCategoryNo: json['rootCategoryNo'] as String?,
      rootCategoryName: json['rootCategoryName'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'imageThumbnailUrl': instance.imageThumbnailUrl,
      'imageMediumUrl': instance.imageMediumUrl,
      'imageUrl': instance.imageUrl,
      'webImageThumbnailUrl': instance.webImageThumbnailUrl,
      'webImageMediumUrl': instance.webImageMediumUrl,
      'webImageUrl': instance.webImageUrl,
      'name': instance.name,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'salePercent': instance.salePercent,
      'isSell': instance.isSell,
      'isSpecialPrice': instance.isSpecialPrice,
      'isNew': instance.isNew,
      'isFreeDelivery': instance.isFreeDelivery,
      'isHeartDelivery': instance.isHeartDelivery,
      'isTodayDelivery': instance.isTodayDelivery,
      'bookmarkCount': instance.bookmarkCount,
      'seller': instance.seller,
      'rootCategoryNo': instance.rootCategoryNo,
      'rootCategoryName': instance.rootCategoryName,
    };
