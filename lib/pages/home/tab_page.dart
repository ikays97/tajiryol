import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/components/my_custom_footer.dart';
import 'package:tajiryol/pages/home/store/tab_provider.dart';
import 'component/brands.dart';
import 'component/promotions.dart';
import 'component/subcat_grid.dart';
import 'component/swiper.dart';

class MyTab extends StatelessWidget {
  final String? tabSlug;

  const MyTab({Key? key, @required this.tabSlug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabProvider(slug: tabSlug),
      child: TabContainer(),
    );
  }
}

class TabContainer extends StatefulWidget {
  // final String tabid;
  TabContainer({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TabContainerState();
}

class TabContainerState extends State<TabContainer>
    with SingleTickerProviderStateMixin {
  final GlobalKey<State> crowdFundingFloorKey = new GlobalKey();
  bool isIntoView = false;
  AnimationController? controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 2000),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TabProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SmartRefresher(
        controller: state.refreshController,
        // header: ShimmerHeader(
        //   text: Text(
        //     "Tazele",
        //     style: TextStyle(
        //       color: Colors.grey,
        //       fontSize: 22,
        //     ),
        //   ),
        // ),
        // enablePullUp: true,
        onRefresh: () => state.initData(refresh: true),
        footer: MyCustomFooter(),
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              TabBrandsWidget(data: state.brands),
              TabSwiperBanner(banners: state.sliders),
              TabPromotions(data: state.promotions),
              TabSubCategoryGrid(subcategories: state.subcategories),
            ],
          ),
        ),
      ),
    );
  }
}
