import 'package:json_annotation/json_annotation.dart';
import 'package:tajiryol/models/child/brand.dart';
import 'package:tajiryol/models/child/promotion.dart';
import 'package:tajiryol/models/child/slider.dart';
import 'package:tajiryol/models/subcategory.dart';
part 'tab.g.dart';

@JsonSerializable()
class TabModel {
  @JsonKey(name: 'slug')
  final String slug;

  @JsonKey(name: 'name_tm')
  final String name_tm;

  @JsonKey(name: 'name_ru')
  final String name_ru;

  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'slides')
  final List<Slider> sliders;

  @JsonKey(name: 'subcategories')
  final List<Subcategory> subcategories;

  @JsonKey(name: 'brands')
  final List<Brand> brands;

  @JsonKey(name: 'promotions')
  final List<Promotion> promotions;

  TabModel({
    this.slug,
    this.name_tm,
    this.name_ru,
    this.icon,
    this.sliders,
    this.subcategories,
    this.brands,
    this.promotions,
  });
  factory TabModel.fromJson(Map<String, dynamic> json) =>
      _$TabModelFromJson(json);

  Map<String, dynamic> toJson() => _$TabModelToJson(this);
}

// slider converter
// class _SliderConverter implements JsonConverter<Slider, Object?> {
//   const _SliderConverter();

//   @override
//   Slider fromJson(Object? json) {
//     if (json is Map<String, dynamic> &&
//         json.containsKey('id') &&
//         json.containsKey('name') &&
//         json.containsKey('image') &&
//         json.containsKey('cat_id')) {
//       return Slider.fromJson(json);
//     }
//     return json as Slider;
//   }

//   @override
//   Object toJson(Slider object) {
//     // This will only work if `object` is a native JSON type:
//     //   num, String, bool, null, etc
//     // Or if it has a `toJson()` function`.
//     return object;
//   }
// }

// // _SubcategoryConverter
// class _SubcategoryConverter implements JsonConverter<Subcategory, Object?> {
//   const _SubcategoryConverter();

//   @override
//   Subcategory fromJson(Object? json) {
//     if (json is Map<String, dynamic> &&
//         json.containsKey('id') &&
//         json.containsKey('name') &&
//         json.containsKey('icon')) {
//       return Subcategory.fromJson(json);
//     }
//     return json as Subcategory;
//   }

//   @override
//   Object toJson(Subcategory object) {
//     // This will only work if `object` is a native JSON type:
//     //   num, String, bool, null, etc
//     // Or if it has a `toJson()` function`.
//     return object;
//   }
// }

// // _BrandConverter
// class _BrandConverter implements JsonConverter<Brand, Object?> {
//   const _BrandConverter();

//   @override
//   Brand fromJson(Object? json) {
//     if (json is Map<String, dynamic> &&
//         json.containsKey('slug') &&
//         json.containsKey('pic_url') &&
//         json.containsKey('name')) {
//       return Brand.fromJson(json);
//     }
//     return json as Brand;
//   }

//   @override
//   Object toJson(Brand object) {
//     // This will only work if `object` is a native JSON type:
//     //   num, String, bool, null, etc
//     // Or if it has a `toJson()` function`.
//     return object;
//   }
// }

// // _PromotionConverter
// class _PromotionConverter implements JsonConverter<Promotion, Object?> {
//   const _PromotionConverter();

//   @override
//   Promotion fromJson(Object? json) {
//     if (json is Map<String, dynamic> &&
//         json.containsKey('id') &&
//         json.containsKey('name') &&
//         json.containsKey('image') &&
//         json.containsKey('cat_id')) {
//       return Promotion.fromJson(json);
//     }
//     return json as Promotion;
//   }

//   @override
//   Object toJson(Promotion object) {
//     // This will only work if `object` is a native JSON type:
//     //   num, String, bool, null, etc
//     // Or if it has a `toJson()` function`.
//     return object;
//   }
// }
