import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/navbar_test.dart';
import 'package:tajiryol/pages/cart/cart_page.dart';
import 'package:tajiryol/pages/category/category.dart';
import 'package:tajiryol/pages/favourite/favourite_page.dart';
import 'package:tajiryol/pages/home/home_page.dart';
import 'package:tajiryol/pages/profile/profile_page.dart';
import 'package:tajiryol/utils/navigator.dart';
import '../../icons.dart';
import 'provider/main_provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mainState = Provider.of<MainProvider>(context);
    MyNavigator.ctx = context;
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        itemColor: Theme.of(context).primaryColor,
        currentIndex: mainState.getTabBarSelectedIndex,
        onChange: (index) {
          mainState.setTabBarSelectedIndex = index;
        },
        children: [
          CustomNavBarItem(
            icon: SvgIcons.home,
            label: 'Home',
          ),
          CustomNavBarItem(
            icon: SvgIcons.category,
            label: 'Category',
          ),
          CustomNavBarItem(
            icon: SvgIcons.cart,
            label: 'Cart',
          ),
          CustomNavBarItem(
            icon: SvgIcons.heart,
            label: 'Favourite',
          ),
          CustomNavBarItem(
            icon: SvgIcons.person,
            label: 'Account',
          ),
        ],
      ),
      body: PageView(
        controller: mainState.tabBarPageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          CategoryPage(),
          CartPage(),
          FavouritesPage(),
          ProfilePage(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
