// import 'package:flutter/cupertino.dart';
// import 'package:yupekyol/pages/search/searchlist.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List hotWords = [];
//   List<String> recomendWords = [];
//   TextEditingController controller = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         brightness: Brightness.light,
//         backgroundColor: KColorConstant.searchAppBarBgColor,
//         actions: <Widget>[
//           SearchTopBarActionWidget(
//             onActionTap: () => goSearchList(controller.text),
//           )
//         ],
//       ),
//       body: HotSugWidget(
//         hotWords: hotWords,
//         goSearchList: goSearchList,
//       ),
//     );
//   }

//   goSearchList(String keyWord) {
//     if (keyWord.trim().isNotEmpty) {
//       Navigator.push(context,
//           CupertinoPageRoute(builder: (BuildContext context) {
//         return SearchResultListPage(keyWord);
//       }));
//     }
//   }
// }
