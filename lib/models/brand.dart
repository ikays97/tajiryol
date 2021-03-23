class BrandItem {
  String id;
  String picUrl;
  String name;
  BrandItem({this.id, this.picUrl, this.name});
  BrandItem.fromJson(Map<String, dynamic> json)
      : id = json["slug"],
        name = json['name'],
        picUrl = json['pic_url'];
}

class BrandItemList {
  List<BrandItem> list;
  BrandItemList({this.list});
  factory BrandItemList.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return BrandItem.fromJson(i);
    }).toList();
    return BrandItemList(list: list);
  }
}
