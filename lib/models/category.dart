import 'package:tajiryol/models/sub_category.dart';

class CategoryModel {
  String icon;
  String name;
  List<SubCategoryModel> subcategories;
  CategoryModel({
    this.name,
    this.subcategories,
    this.icon,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      icon: json['icon'],
      name: json['name'],
      subcategories: List<SubCategoryModel>.from(
          json['list'].map((e) => SubCategoryModel.fromJson(e))),
    );
  }
}

class CategoryListModel {
  List<CategoryModel> list;
  CategoryListModel({this.list});
  factory CategoryListModel.fromJson(dynamic json) {
    var items = json as List;
    var itemModals = items.map((item) {
      return CategoryModel.fromJson(item);
    }).toList();
    return CategoryListModel(list: itemModals);
  }
}
