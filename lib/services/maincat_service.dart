import 'package:tajiryol/models/maincategory.dart';
import 'package:tajiryol/utils/request.dart';

// initial tabs info
class MainCatAPI {
  static Future<MaincategoryList> getData() async {
    var response = await RequestUtil().get('maincategories');
    return MaincategoryList.fromJson(response);
  }
}
