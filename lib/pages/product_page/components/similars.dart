import 'package:flutter/material.dart';
import 'package:tajiryol/components/my_cached_image.dart';

import '../defaults.dart';
import '../product_page.dart';

class BuildSimilars extends StatelessWidget {
  const BuildSimilars({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 12),
                      child: Text(
                        'Menzes Harytlar',
                        style: productLabelStyle,
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(good.similars.length, (i) {
                          final product = good.similars[i];
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Container(
                              width: 153,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.09),
                                    offset: Offset(0, 3),
                                    blurRadius: 8.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 143,
                                    height: 163,
                                    child: ClipRRect(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      borderRadius: BorderRadius.circular(12),
                                      child: MyCachedNetworkImage(
                                        imageurl: product.image,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        text: products[i].brand,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${product.name}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "${product.standardPrice} TMT",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black26,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          Text(
                                            "${product.discountPrice} TMT",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: mostUsedColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.6),
                                              )),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Sebetde arzan',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  "${product.cartPrice} TMT",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
