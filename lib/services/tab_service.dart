import 'package:tajiryol/models/tab.dart';
import 'package:tajiryol/utils/request.dart';

// -> maincategory/{maincategory}
// all data of tab
class TabAPI {
  static Future<TabModel> getData(String slug) async {
    var response = await RequestUtil().get('maincategory/$slug');
    return TabModel.fromJson(response);
  }
}
