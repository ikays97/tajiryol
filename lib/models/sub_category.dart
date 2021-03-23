class SubCategoryModel {
  String id;
  String name;
  String icon;
  SubCategoryModel({this.id, this.name, this.icon});
  SubCategoryModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json['name'],
        icon = json['pic_url'];
}

class SubCategoryListModel {
  List<SubCategoryModel> list;
  SubCategoryListModel({this.list});
  factory SubCategoryListModel.fromJson(dynamic json) {
    var items = json as List;
    var itemModals = items.map((item) {
      return SubCategoryModel.fromJson(item);
    }).toList();
    return SubCategoryListModel(list: itemModals);
  }
}
