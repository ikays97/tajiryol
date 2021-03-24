import 'package:json_annotation/json_annotation.dart';
part 'promotion.g.dart';

@JsonSerializable()
class Promotion {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'cat_id')
  final int? catId;

  Promotion({this.id, this.name, this.image, this.catId});

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionToJson(this);
}
