// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return Promotion(
    id: json['id'] as int,
    name: json['name'] as String,
    catId: json['cat_id'] as int,
    bannerTM: json['banner_tm'] as String,
    bannerRU: json['banner_ru'] as String,
  );
}

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'banner_tm': instance.bannerTM,
      'banner_ru': instance.bannerRU,
      'cat_id': instance.catId,
    };
