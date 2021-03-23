import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tajiryol/models/slider.dart';
import 'package:tajiryol/widgets/my_cached_image.dart';

class TabSwiperBanner extends StatelessWidget {
  final List<SliderItem> banners;
  TabSwiperBanner({this.banners});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height * 0.2;
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.black12,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Swiper(
          itemBuilder: (BuildContext context, index) {
            return MyCachedNetworkImage(
              imageurl: banners[index].slide,
            );
          },
          itemCount: banners.length,
          pagination: new SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: RectSwiperPaginationBuilder(
              color: Color(0xFF999999),
              activeColor: Colors.red,
              size: Size(5.0, 2),
              activeSize: Size(5, 5),
            ),
          ),
          curve: Curves.easeIn,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('$index'),
        ),
      ),
    );
  }
}
