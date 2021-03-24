// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    name_tm: json['name_tm'] as String,
    name_ru: json['name_ru'] as String,
    icon: json['icon'] as String,
    categories: (json['categories'] as List<dynamic>)
        .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name_tm': instance.name_tm,
      'name_ru': instance.name_ru,
      'icon': instance.icon,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
