import 'package:json_annotation/json_annotation.dart';
part 'brand.g.dart';

@JsonSerializable()
class Brand {
  @JsonKey(name: 'slug')
  final String slug;

  @JsonKey(name: 'pic_url')
  final String picUrl;

  @JsonKey(name: 'name')
  final String name;

  const Brand({required this.slug, required this.picUrl, required this.name});

  factory Brand.fromJson(Map<String, dynamic>? json) => _$BrandFromJson(json!);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
