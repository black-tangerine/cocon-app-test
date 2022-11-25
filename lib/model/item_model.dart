import 'package:json_annotation/json_annotation.dart'; // => Name source files using `lowercase_with_underscores`

part 'item_model.g.dart';

@JsonSerializable()

class ItemModel{

  ItemModel({
    required this.id,
    required this.imageThumbnailUrl,
    required this.imageMediumUrl,
    required this.imageUrl,
    required this.webImageThumbnailUrl,
    required this.webImageMediumUrl,
    required this.webImageUrl,
    required this.name,
    required this.price,
    required this.salePrice,
    required this.salePercent,
    required this.isSell,
    required this.isSpecialPrice,
    required this.isNew,
    required this.isFreeDelivery,
    required this.isHeartDelivery,
    required this.isTodayDelivery,
    required this.bookmarkCount,
    required this.seller,
    required this.rootCategoryNo,
    required this.rootCategoryName,
  });
  String? id;
  String? imageThumbnailUrl;
  String? imageMediumUrl;
  String? imageUrl;
  String? webImageThumbnailUrl;
  String? webImageMediumUrl;
  String? webImageUrl;
  String? name;
  int? price;
  int? salePrice;
  int? salePercent;
  bool? isSell;
  bool? isSpecialPrice;
  bool? isNew;
  bool? isFreeDelivery;
  bool? isHeartDelivery;
  bool? isTodayDelivery;
  int? bookmarkCount;
  Map<String, dynamic>? seller;
  String? rootCategoryNo;
  String? rootCategoryName;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String,dynamic> toJson() => _$ItemModelToJson(this);

  //@override
  String? get sellerId => seller!['id'] as String;
  String? get sellerName => seller!['name'] as String;
  String? get sellerEnName => seller!['en_name'] as String;
  String? get sellerImageUrl => seller!['image_url'] as String;
  String? get sellerText => seller!['text'] as String;
  bool? get sellerIsBrandstore => seller!['is_brandstore'] as bool;
  bool? get sellerIsPartner => seller!['is_partner'] as bool;

}
