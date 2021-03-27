import 'package:flutter/material.dart';

import '../defaults.dart';

class BuildColors extends StatelessWidget {
  const BuildColors({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Text(
                    'Renkler',
                    style: productLabelStyle,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(renkler.length, (i) {
                      return Card(
                        color:
                            i == 0 ? renkler[i] : renkler[i].withOpacity(0.5),
                        clipBehavior: Clip.hardEdge,
                        borderOnForeground: true,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: i == 0 ? 3 : 0,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      );
                    }),
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
