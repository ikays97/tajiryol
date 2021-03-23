import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yupekyol/models/category.dart';
import 'package:yupekyol/pages/home/provider/tab_provider.dart';
import 'components/banner.dart';
import 'components/menue.dart';

class MyTab extends StatefulWidget {
  final CategoryModel tab;

  const MyTab({Key key, @required this.tab}) : super(key: key);

  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => TabProvider(tab: widget.tab),
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
    print(state.brands);
    print(state.sliders);
    return NotificationListener<ScrollNotification>(
      onNotification: _onScroll,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SmartRefresher(
          controller: state.refreshController,
          enablePullUp: true,
          onRefresh: () => state.initData(refresh: true),
          header: WaterDropMaterialHeader(),
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              HomeBrandsWidget(data: state.brands),
              HomeSwiperBanner(banners: state.sliders),
              // RecommendFloor(data: state.subcategories),
            ],
          ),
        ),
      ),
    );
  }

  bool _onScroll(ScrollNotification scroll) {
    if (scroll.depth == 0) {
      var currentContext = crowdFundingFloorKey.currentContext;
      if (currentContext == null) return false;
      RenderBox box = currentContext.findRenderObject();
      RenderBox listBox = scroll.context.findRenderObject();
      RenderAbstractViewport viewport = RenderAbstractViewport.of(box);
      //var offsetToRevealBottom = viewport.getOffsetToReveal(box, 1.0);
      var offset = viewport.getOffsetToReveal(box, 0.5); //
      Size size = box.size;
      double scrollY = scroll.metrics.pixels;
      // double insideHeight = scroll.metrics.extentInside;
      double insideHeight = listBox.size.height; //listView
      if ((scrollY + insideHeight > offset.offset + size.height) &&
          (offset.offset + size.height > scrollY)) {
        if (!isIntoView) {
          isIntoView = true;
          controller.forward(from: 0);
        }
      } else {
        if (isIntoView) {
          isIntoView = false;
        }
      }
    }
    return false;
  }
}