import 'package:json_annotation/json_annotation.dart';
part 'subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'icon')
  final String? icon;

  Subcategory({this.id, this.name, this.icon});

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}
