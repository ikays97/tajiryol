import 'package:json_annotation/json_annotation.dart';
part 'slider.g.dart';

@JsonSerializable()
class Slider {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'cat_id')
  final int catId;

  const Slider({this.id, this.name, this.image, this.catId});

  factory Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);

  Map<String, dynamic> toJson() => _$SliderToJson(this);
}
