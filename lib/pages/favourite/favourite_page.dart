import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/pages/product_page/defaults.dart';

const String random =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Officia repellendus alias, officiis sed rem facilis!";

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: false,
            elevation: 3,
            title: Text.rich(
              TextSpan(
                text: 'Halanlarym ',
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                      text: '- 14 haryt',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: size.height * 0.159,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 8,
                        color: Colors.black54.withOpacity(0.03),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // TODO: checkbox
                      Container(
                        width: size.width * 0.24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MyCachedNetworkImage(imageurl: url),
                        ),
                      ),
                      //
                      SizedBox(width: 10),
                      //
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Marka  ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: random,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 4,
                                          color: Color(0xff555555)
                                              .withOpacity(0.16),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.heart_fill,
                                        size: 20,
                                        color: isLiked
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Beden: 9-12',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Takmynan 4-12 sagatda eltip bermek',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 6, right: 6, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Color(0xff00BE67),
                                  )),
                                  child: Text(
                                    '64.99 TMT',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff00BE67),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF29B62),
                                  ),
                                  child: Text(
                                    'Sebede gos'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
