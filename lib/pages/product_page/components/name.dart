import 'package:flutter/material.dart';

import '../defaults.dart';
import '../product_page.dart';

class BuildName extends StatelessWidget {
  const BuildName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(good.brand, style: productLabelStyle),
                Text(
                  good.name,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Satyjy: ',
                    children: <TextSpan>[
                      TextSpan(
                        text: good.supplier,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.blue,
                            ),
                      )
                    ],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
