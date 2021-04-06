import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/components/my_bottom_navbar.dart';
import 'package:tajiryol/pages/cart/cart_page.dart';
import 'package:tajiryol/pages/category/category.dart';
import 'package:tajiryol/pages/favourite/favourite_page.dart';
import 'package:tajiryol/pages/home/home_page.dart';
import 'package:tajiryol/pages/profile/profile_page.dart';
import 'package:tajiryol/utils/navigator.dart';
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
    // hideScreen();
  }

  // Future<void> hideScreen() async {
  //   Future.delayed(Duration(milliseconds: 750), () {
  //     FlutterSplashScreen.hide();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mainState = Provider.of<MainProvider>(context);
    MyNavigator.ctx = context;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: MyBottomNavigationBar(
          onTap: (index) {
            print(index);
            mainState.tabBarPageController.jumpToPage(index);
            setState(() {
              mainState.setTabBarSelectedIndex = index;
            });
          },
        ),
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
