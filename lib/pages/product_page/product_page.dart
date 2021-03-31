import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajiryol/pages/product_page/components/similars.dart';
import 'package:tajiryol/utils/navigator.dart';
import '../../extensions.dart';
import 'components/about.dart';
import 'components/appbar.dart';
import 'components/bottom.dart';
import 'components/card.dart';
import 'components/colors.dart';
import 'components/name.dart';
import 'components/sizes.dart';
import 'defaults.dart';

Good good = Good(similars: products);

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isColorSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TODO - provide product state here
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                BuildAppBar(),
                BuildName(),
                BuildColors(),
                BuildSizes(),
                BuildAbout(),
                BuildSimilars(),
                BuildCard(
                  leftText: Text('Takmynan ertjek wagty: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  rightText: Text(
                    good.deliveryTime,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                BuildCard(
                    leftText: Text('Eltip bermek hyzmaty:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        )),
                    rightText: Text(
                      good.deliveryCharge,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    )),
                BuildCard(
                  leftText: Text(good.supplier,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  rightText: Text(
                    "Harytlaryny gor >",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                BuildCard(
                  leftText: Text(
                    'Şikaýat et',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () => _reportDialog(context),
                ),
              ],
            ),
          ),
          // TODO - provide cart state here
          CartBottom(),
        ],
      ),
    );
  }

  void _reportDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Anyk cykjakmy?'),
          content: Text(
            "Karoci cykmana razymy? bir cyksan girmek ansat daldir aytmady diyme jiiim",
          ),
          actions: [
            TextButton(
              onPressed: () => MyNavigator.pop(),
              child: Text(
                'Yogou onda',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                MyNavigator.pop();
                showSnackbar(
                    context, "Karoci cykarjak dal seni, soragyn bamy?");
              },
              child: Text(
                'Bor cykayynlay',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
