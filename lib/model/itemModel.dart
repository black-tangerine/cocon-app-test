import 'package:json_annotation/json_annotation.dart';

part 'itemModel.g.dart';

@JsonSerializable(nullable: true)

class ItemModel{

  ItemModel({
    required this.id,
    required this.image_thumbnail_url,
    required this.image_medium_url,
    required this.image_url,
    required this.web_image_thumbnail_url,
    required this.web_image_medium_url,
    required this.web_image_url,
    required this.name,
    required this.price,
    required this.sale_price,
    required this.sale_percent,
    required this.is_sell,
    required this.is_special_price,
    required this.is_new,
    required this.is_free_delivery,
    required this.is_heart_delivery,
    required this.is_today_delivery,
    required this.bookmark_count,
    required this.seller,
    required this.root_category_no,
    required this.root_category_name,
  });
  String? id;
  String? image_thumbnail_url;
  String? image_medium_url;
  String? image_url;
  String? web_image_thumbnail_url;
  String? web_image_medium_url;
  String? web_image_url;
  String? name;
  int? price;
  int? sale_price;
  int? sale_percent;
  bool? is_sell;
  bool? is_special_price;
  bool? is_new;
  bool? is_free_delivery;
  bool? is_heart_delivery;
  bool? is_today_delivery;
  int? bookmark_count;
  Map<String, dynamic>? seller;
  String? root_category_no;
  String? root_category_name;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String,dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String? get seller_id => seller!['id'] as String;
  String? get seller_name => seller!['name'] as String;
  String? get seller_en_name => seller!['en_name'] as String;
  String? get seller_image_url => seller!['image_url'] as String;
  String? get seller_text => seller!['text'] as String;
  bool? get seller_is_brandstore => seller!['is_brandstore'] as bool;
  bool? get seller_is_partner => seller!['is_partner'] as bool;

}
