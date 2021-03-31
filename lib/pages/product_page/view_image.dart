import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tajiryol/components/my_cached_image.dart';

class ViewImages extends StatefulWidget {
  @override
  ViewImagesState createState() => ViewImagesState();
}

class ViewImagesState extends State<ViewImages> {
  // TODO: getimages from previous page
  List<String> images = [
    "https://cdn.dsmcdn.com//ty12/product/media/images/20200907/17/9977535/65804247/1/1_org.jpg",
    "https://cdn.dsmcdn.com//ty51/product/media/images/20210112/5/51366739/61567409/1/1_org.jpg",
    "https://cdn.dsmcdn.com//ty66/product/media/images/20210203/20/59743388/62876953/4/4_org.jpg",
    "https://cdn.dsmcdn.com//ty82/product/media/images/20210309/22/70314515/150001852/1/1_org.jpg",
  ];

  bool _showAppbar = true; //this is to show app bar
  bool _show = true;
  double bottomBarHeight = 75; // set bottom bar height
  double _bottomBarOffset = 0;

  Widget bodyContent(BuildContext context) {
    // image interactive viewer
    return Center(
      child: Container(
        height: 350,
        color: Colors.transparent,
        child: Swiper(
          itemBuilder: (BuildContext context, index) {
            return InteractiveViewer(
              constrained: true,
              child: MyCachedNetworkImage(
                imageurl: images[index],
              ),
            );
          },
          itemCount: images.length,
          curve: Curves.easeIn,
          scrollDirection: Axis.horizontal,
          autoplay: false,
          onTap: (index) => print('$index'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppbar
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('Harydyn ady'),
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      bottomNavigationBar: Container(
        height: bottomBarHeight,
        width: MediaQuery.of(context).size.width,
        child: _show
            ? Container(
                height: 50,
                child: Center(
                  child: Text('suradyn ady we maglumatlary'),
                ),
              )
            : Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
      ),
      body: bodyContent(context),
    );
  }
}
