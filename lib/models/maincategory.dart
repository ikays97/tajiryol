import 'dart:html';

import 'package:json_annotation/json_annotation.dart';
part 'maincategory.g.dart';

@JsonSerializable()
class Maincategory {
  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'name_tm')
  final String? nameTM;

  @JsonKey(name: 'name_ru')
  final String? nameRU;

  const Maincategory({this.slug, this.nameRU, this.nameTM});

  factory Maincategory.fromJson(Map<String, dynamic> json) =>
      _$MaincategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MaincategoryToJson(this);
}

@JsonSerializable()
class MaincategoryList {
  @JsonKey(name: 'data')
  final List<Maincategory> maincategories;

  const MaincategoryList({required this.maincategories});

  factory MaincategoryList.fromJson(Map<String, dynamic> json) =>
      _$MaincategoryListFromJson(json);
  Map<String, dynamic> toJson() => _$MaincategoryListToJson(this);
}
