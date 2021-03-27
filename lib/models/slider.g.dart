// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slider _$SliderFromJson(Map<String, dynamic> json) {
  return Slider(
    id: json['id'] as int,
    name: json['name'] as String,
    image: json['image'] as String,
    catId: json['cat_id'] as int,
  );
}

Map<String, dynamic> _$SliderToJson(Slider instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'cat_id': instance.catId,
    };
