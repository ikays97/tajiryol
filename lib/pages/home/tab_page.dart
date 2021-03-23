import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/pages/home/store/tab_provider.dart';
import 'package:tajiryol/widgets/my_custom_footer.dart';
import 'package:tajiryol/widgets/shimmer_header.dart';
import 'component/brands.dart';
import 'component/promotions.dart';
import 'component/subcat_grid.dart';
import 'component/swiper.dart';

class MyTab extends StatefulWidget {
  final String tabSlug;

  const MyTab({Key key, @required this.tabSlug}) : super(key: key);

  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => TabProvider(slug: widget.tabSlug),
      child: FirstTabContainer(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FirstTabContainer extends StatefulWidget {
  // final String tabid;
  FirstTabContainer({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => FirstTabContainerState();
}

class FirstTabContainerState extends State<FirstTabContainer>
    with SingleTickerProviderStateMixin {
  final GlobalKey<State> crowdFundingFloorKey = new GlobalKey();
  bool isIntoView = false;
  AnimationController controller;
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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TabProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SmartRefresher(
        controller: state.refreshController,
        header: ShimmerHeader(
          text: Text(
            "Tazele",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 22,
            ),
          ),
        ),
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

  // bool _onScroll(ScrollNotification scroll) {
  //   if (scroll.depth == 0) {
  //     var currentContext = crowdFundingFloorKey.currentContext;
  //     if (currentContext == null) return false;
  //     RenderBox box = currentContext.findRenderObject();
  //     RenderBox listBox = scroll.context.findRenderObject();
  //     RenderAbstractViewport viewport = RenderAbstractViewport.of(box);
  //     //var offsetToRevealBottom = viewport.getOffsetToReveal(box, 1.0);
  //     var offset = viewport.getOffsetToReveal(box, 0.5); //
  //     Size size = box.size;
  //     double scrollY = scroll.metrics.pixels;
  //     // double insideHeight = scroll.metrics.extentInside;
  //     double insideHeight = listBox.size.height; //listView
  //     if ((scrollY + insideHeight > offset.offset + size.height) &&
  //         (offset.offset + size.height > scrollY)) {
  //       if (!isIntoView) {
  //         isIntoView = true;
  //         controller.forward(from: 0);
  //       }
  //     } else {
  //       if (isIntoView) {
  //         isIntoView = false;
  //       }
  //     }
  //   }
  //   return false;
  // }
}
