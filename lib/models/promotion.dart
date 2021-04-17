import 'package:json_annotation/json_annotation.dart';
part 'promotion.g.dart';

@JsonSerializable()
class Promotion {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'banner_tm')
  final String bannerTM;

  @JsonKey(name: 'banner_ru')
  final String bannerRU;

  @JsonKey(name: 'cat_id')
  final int catId;

  Promotion({this.id, this.name, this.catId, this.bannerTM, this.bannerRU});

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionToJson(this);
}
