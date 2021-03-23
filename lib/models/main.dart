class MainModel {
  String slug;
  String name_tm;
  String name_ru;
  MainModel({
    this.slug,
    this.name_tm,
    this.name_ru,
  });
  MainModel.fromJson(Map<String, dynamic> json) 
      : slug = json['pic_url'],
        
}

class MainListModel {
  List<MainModel> list;
  MainListModel({this.list});
  factory MainListModel.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return MainModel.fromJson(i);
    }).toList();
    return MainListModel(list: list);
  }
}
