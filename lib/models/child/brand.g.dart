// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    slug: json['slug'] as String,
    picUrl: json['pic_url'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'slug': instance.slug,
      'pic_url': instance.picUrl,
      'name': instance.name,
    };
