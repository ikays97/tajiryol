import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/components/my_appbar.dart';
import 'package:tajiryol/components/my_bottom_navbar.dart';
import 'package:tajiryol/pages/cart/cart_page.dart';
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
          TestPage2(),
          CartPage(),
          FavouritesPage(),
          ProfilePage(),
          // ProfilePage(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        leadingType: AppBarBackType.None,
        title: Text(
          "Category",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).cardColor,
        child: Center(
          child: Text(
            "Category",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        leadingType: AppBarBackType.None,
        title: Text(
          "Favourites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).cardColor,
        child: Center(
          child: Text(
            "favourites",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
