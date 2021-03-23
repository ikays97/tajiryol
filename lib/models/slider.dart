class SliderItem {
  String slide;
  SliderItem({this.slide});
  SliderItem.fromJson(Map<String, dynamic> json) : slide = json['pic_url'];
}

class SliderItemList {
  List<SliderItem> list;
  SliderItemList({this.list});
  factory SliderItemList.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return SliderItem.fromJson(i);
    }).toList();
    return SliderItemList(list: list);
  }
}
