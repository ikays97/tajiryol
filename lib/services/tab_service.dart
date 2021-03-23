import 'package:tajiryol/models/tab.dart';
import 'package:tajiryol/utils/request.dart';

class TabAPI {
  static Future<TabModel> getTabData() async {
    var response = await RequestUtil().get('maincategories');
    // var res = await rootBundle.loadString('assets/json/tabs.json');
    // var response = json.decode(res);
    return TabModel.fromJson(response['data']);
  }
}
