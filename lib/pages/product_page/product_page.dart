import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tajiryol/components/my_appbar.dart';
import 'package:tajiryol/components/my_cached_image.dart';

const String url =
    "https://cdn.dsmcdn.com/mnresize/415/622/ty54/product/media/images/20210112/17/52212067/70085589/3/3_org.jpg";

const String text =
    "Item Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla porro non cupiditate illum.";

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            stretchTriggerOffset: 150,
            onStretchTrigger: () async {
              print('yokardan cekesi gelip olup barya');
            },
            leading: Icon(Icons.arrow_back),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Text('US Polo T-Shirt'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.favorite_outline,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                // StretchMode.blurBackground,
              ],
              collapseMode: CollapseMode.pin,
              background: MyCachedNetworkImage(
                imageurl: url,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SingleChildScrollView(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           ClipRRect(
          //             borderRadius: BorderRadius.circular(14),
          //             child: Container(
          //               width: double.infinity,
          //               padding: EdgeInsets.symmetric(
          //                 vertical: 8,
          //                 horizontal: 10,
          //               ),
          //               color: Colors.white,
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text('USSR Marco Polo',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText2
          //                           .copyWith(
          //                             fontSize: 18,
          //                           )),
          //                   Text(
          //                     'Harydyn doly ady su ýerde ady su ýerde',
          //                     style: TextStyle(
          //                       color: Colors.grey,
          //                       fontWeight: FontWeight.w300,
          //                       fontSize: 18,
          //                     ),
          //                   ),
          //                   RichText(
          //                     text: TextSpan(
          //                       text: 'Satyjy: ',
          //                       children: <TextSpan>[
          //                         TextSpan(
          //                           text: ' Mekan',
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .bodyText1
          //                               .copyWith(
          //                                 color: Colors.blue,
          //                               ),
          //                         )
          //                       ],
          //                       style: Theme.of(context).textTheme.bodyText1,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
