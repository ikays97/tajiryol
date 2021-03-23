class PromotionModel {
  String id;
  String picUrl;
  String name;
  PromotionModel({this.id, this.picUrl, this.name});
  PromotionModel.fromJson(Map<String, dynamic> json) : picUrl = json['pic_url'];
}

class PromotionListModel {
  List<PromotionModel> list;
  PromotionListModel({this.list});
  factory PromotionListModel.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return PromotionModel.fromJson(i);
    }).toList();
    return PromotionListModel(list: list);
  }
}
