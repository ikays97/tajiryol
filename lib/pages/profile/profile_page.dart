import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajiryol/extensions.dart';
import 'package:tajiryol/pages/profile/edit_account.dart';
import 'package:tajiryol/pages/profile/last_orders.dart';
import 'package:tajiryol/pages/profile/sellers.dart';
import 'package:tajiryol/utils/navigator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appbar
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(37),
                          bottomRight: Radius.circular(37),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.06),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mekan Annayev',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '+993 63 123456',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // garasylyar
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.06),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Garasylyar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffFF8500).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '#123456',
                                      style: TextStyle(
                                        color: Color(0xffCB6A00),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '15 haryt',
                                      style: TextStyle(
                                        color: Color(0xffCB6A00),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '199 TMT',
                                style: TextStyle(
                                  color: Color(0xffCB6A00),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.cart_fill,
                    title: 'Soňky sarganlarym',
                    onTap: () => MyNavigator.push(LastOrdersPage()),
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.settings,
                    onTap: () => MyNavigator.push(EditAccountPage()),
                    title: 'Hasaby üýtget',
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.person_2_alt,
                    title: 'Satyjylar',
                    onTap: () => MyNavigator.push(SellersPage()),
                  ),
                  SettingsListTile(
                    icon: Icons.logout,
                    onTap: () => _logoutDialog(context),
                    title: 'Çykjak',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logoutDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Anyk cykjakmy?'),
            content: Text(
                "Karoci cykmana razymy? bir cyksan girmek ansat daldir aytmady diyme jiiim"),
            actions: [
              TextButton(
                  onPressed: () => MyNavigator.pop(),
                  child: Text(
                    'Yogou onda',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    MyNavigator.pop();
                    showSnackbar(context, "Karoci cykarjak dal seni, sorag?");
                  },
                  child: Text(
                    'Bor cykayynlay',
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key key,
    @required this.icon,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.06),
              ),
            ]),
        child: ListTile(
          // contentPadding:
          //     const EdgeInsets.only(left: 10, right: 10),
          leading: Icon(
            icon,
            color: Color(0xff444444),
          ),
          title: Transform.translate(
            offset: Offset(-16, 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
