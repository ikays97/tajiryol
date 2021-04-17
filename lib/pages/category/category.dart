import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/components/my_loading.dart';
import 'package:tajiryol/pages/category/components/search_bar.dart';
import 'package:tajiryol/pages/category/store/category_provider.dart';

import 'components/left.dart';
import 'components/right_list_view.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
      child: CategoryPageContainer(),
    );
  }
}

class CategoryPageContainer extends StatefulWidget {
  CategoryPageContainer({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryPageContainerState();
}

class CategoryPageContainerState extends State<CategoryPageContainer>
    with AutomaticKeepAliveClientMixin {
  int currentPage = 0;
  GlobalKey<RightListViewState> rightListviewKey =
      new GlobalKey<RightListViewState>();
  GlobalKey<CategoryMenueState> categoryMenueKey =
      new GlobalKey<CategoryMenueState>();

  bool isAnimating = false;
  int itemCount = 0;
  double menueWidth;
  double itemHeight;
  double height;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double statusBarHeight =
        MediaQuery.of(context).padding.top; // Height of top status bar
    final double bottomBarHeight =
        MediaQuery.of(context).padding.bottom; // Height of bottom status bar
    final double scafoldHeight = 44; // Scafold height
    final double searchBarHeight = 49; // The height of the search box
    final double bottomTabbarHeight = 49; // The height of the bottom tabBar
    final double rightListViewHeight = MediaQuery.of(context).size.height -
        statusBarHeight -
        bottomBarHeight -
        scafoldHeight -
        searchBarHeight -
        bottomTabbarHeight;
    // final double rightListViewHeight = 600;
    final state = Provider.of<CategoryProvider>(context);
    // List<SubCategoryListModel> listViewData = [];
    return state.loading
        ? Center(child: ProgressIndicatorSmall())
        : Container(
            color: Color(0xFFFFFFFF),
            child: Column(
              children: <Widget>[
                SearchBar(),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      // left
                      SingleChildScrollView(
                        child: Container(
                          color: Color(0xFFf7f7f7),
                          width: 100,
                          child: CategoryMenue(
                            key: categoryMenueKey,
                            categories: state.categoryDatas,
                            itemHeight: 60,
                            itemWidth: 80,
                            menueTaped: menueItemTap,
                          ),
                        ),
                      ),
                      // right
                      RightListView(
                        key: rightListviewKey,
                        height: rightListViewHeight,
                        categories: state.categoryDatas,
                        listViewChanged: listViewChanged,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  menueItemTap(int i) {
    rightListviewKey.currentState.jumpTopage(i);
  }

  listViewChanged(i) {
    this.categoryMenueKey.currentState.moveToTap(i);
  }

  @override
  bool get wantKeepAlive => true;
}
