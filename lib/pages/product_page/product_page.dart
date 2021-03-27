import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajiryol/pages/product_page/components/similars.dart';
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
                  leftText: 'Takmynan ertjek wagty: ',
                  rightText: good.deliveryTime,
                ),
                BuildCard(
                  leftText: 'Eltip bermek hyzmaty:',
                  rightText: good.deliveryCharge,
                ),
                BuildCard(
                  leftText: good.supplier,
                  rightText: "Harytlaryny gor >",
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
}
