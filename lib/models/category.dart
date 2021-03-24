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
    required this.name_tm,
    required this.name_ru,
    required this.icon,
    required this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

// class _Converter<T> implements JsonConverter<Subcategory, Object?> {
//   const _Converter();

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
