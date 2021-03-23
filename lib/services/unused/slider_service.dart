// import 'dart:convert';
// import 'package:tajiryol/models/slider.dart';
// import 'package:tajiryol/utils/request.dart';
// import 'package:flutter/services.dart';

// class SliderAPI {
//   static Future<SliderItemList> getSlidersData(String slug) async {
//     // var response = await RequestUtil().get('/$slug/sliders');
//     var res = await rootBundle.loadString(
//       'assets/json/tab_${slug}_sliders.json',
//     );
//     var response = json.decode(res);
//     return SliderItemList.fromJson(response['data']);
//   }
// }
