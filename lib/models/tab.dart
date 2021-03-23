import 'package:tajiryol/models/brand.dart';
import 'package:tajiryol/models/promotion.dart';
import 'package:tajiryol/models/slider.dart';
import 'package:tajiryol/models/sub_category.dart';

class TabModel {
  String slug_tm;
  String slug_ru;
  String name_tm;
  String name_ru;
  String icon;
  List<SliderItem> slides;
  List<SubCategoryModel> subcategories;
  List<BrandItem> brands;
  List<PromotionModel> promotions;

  TabModel({
    this.slug_tm,
    this.slug_ru,
    this.name_tm,
    this.name_ru,
    this.icon,
    this.slides,
    this.subcategories,
    this.brands,
    this.promotions,
  });

  TabModel.fromJson(Map<String, dynamic> json)
      : slug_tm = json['slug_tm'],
        slug_ru = json['slug_ru'],
        name_tm = json['name_tm'],
        name_ru = json['name_ru'],
        icon = json['icon'],
        slides = List<SliderItem>.from(
          json['slides'].map(
            (e) => SliderItem.fromJson(e),
          ),
        ),
        subcategories = List<SubCategoryModel>.from(
          json['subcategories'].map(
            (e) => SubCategoryModel.fromJson(e),
          ),
        ),
        brands = List<BrandItem>.from(
          json['brands'].map(
            (e) => BrandItem.fromJson(e),
          ),
        ),
        promotions = List<PromotionModel>.from(
          json['promotions'].map(
            (e) => PromotionModel.fromJson(e),
          ),
        );
}

class TabListModel {
  List<TabModel> list;
  TabListModel({this.list});
  factory TabListModel.fromJson(dynamic json) {
    var items = json as List;
    var itemModals = items.map((item) {
      return TabModel.fromJson(item);
    }).toList();
    return TabListModel(list: itemModals);
  }
}
