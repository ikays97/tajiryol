import 'package:flutter/material.dart';
import '../cart/cart.dart';
import '../category/category.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  PageController pageController;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: Klength.designWidth)..init(context);

    double extralHeight = Klength.topBarHeight +
        Klength.bottomBarHeight +
        ScreenUtil.statusBarHeight +
        ScreenUtil.bottomBarHeight;

    List<Widget> widgets = [
      HomePage(),
      CategoryPage(),
      Cart(),
      Profile(),
    ];
    return Scaffold(
      bottomNavigationBar: KKBottomAppBar(
        actviveColor: KColorConstant.themeColor,
        onTabSeleted: onTap,
        color: KColorConstant.tabtxtColor,
        items: [
          BottomAppBarItemModal(Icons.home),
          BottomAppBarItemModal(Icons.menu),
          BottomAppBarItemModal(Icons.favorite_border_outlined),
          BottomAppBarItemModal(Icons.shopping_bag_outlined),
          BottomAppBarItemModal(Icons.person_outline),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          children: widgets,
          index: currentPage,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      this.currentPage = index;
    });
  }
}
