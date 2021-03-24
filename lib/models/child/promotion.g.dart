// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return Promotion(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    catId: json['cat_id'] as int?,
  );
}

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'cat_id': instance.catId,
    };
