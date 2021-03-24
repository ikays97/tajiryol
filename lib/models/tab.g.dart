// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabModel _$TabModelFromJson(Map<String, dynamic> json) {
  return TabModel(
    slug: json['slug'] as String,
    name_tm: json['name_tm'] as String,
    name_ru: json['name_ru'] as String,
    icon: json['icon'] as String,
    sliders: (json['slides'] as List<dynamic>)
        .map((e) => Slider.fromJson(e as Map<String, dynamic>))
        .toList(),
    subcategories: (json['subcategories'] as List<dynamic>)
        .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    brands: (json['brands'] as List<dynamic>)
        .map((e) => Brand.fromJson(e as Map<String, dynamic>?))
        .toList(),
    promotions: (json['promotions'] as List<dynamic>)
        .map((e) => Promotion.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TabModelToJson(TabModel instance) => <String, dynamic>{
      'slug': instance.slug,
      'name_tm': instance.name_tm,
      'name_ru': instance.name_ru,
      'icon': instance.icon,
      'slides': instance.sliders.map((e) => e.toJson()).toList(),
      'subcategories': instance.subcategories.map((e) => e.toJson()).toList(),
      'brands': instance.brands.map((e) => e.toJson()).toList(),
      'promotions': instance.promotions.map((e) => e.toJson()).toList(),
    };
