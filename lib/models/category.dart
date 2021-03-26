import 'package:json_annotation/json_annotation.dart';
import 'package:tajiryol/models/subcategory.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'name_tm')
  final String name_tm;

  @JsonKey(name: 'name_ru')
  final String name_ru;

  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'categories')
  final List<Subcategory> categories;

  Category({
    this.name_tm,
    this.name_ru,
    this.icon,
    this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
