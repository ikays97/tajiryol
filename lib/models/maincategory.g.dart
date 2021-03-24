// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maincategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Maincategory _$MaincategoryFromJson(Map<String, dynamic> json) {
  return Maincategory(
    slug: json['slug'] as String?,
    nameRU: json['name_ru'] as String?,
    nameTM: json['name_tm'] as String?,
  );
}

Map<String, dynamic> _$MaincategoryToJson(Maincategory instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name_tm': instance.nameTM,
      'name_ru': instance.nameRU,
    };

MaincategoryList _$MaincategoryListFromJson(Map<String, dynamic> json) {
  return MaincategoryList(
    maincategories: (json['data'] as List<dynamic>)
        .map((e) => Maincategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MaincategoryListToJson(MaincategoryList instance) =>
    <String, dynamic>{
      'data': instance.maincategories.map((e) => e.toJson()).toList(),
    };
