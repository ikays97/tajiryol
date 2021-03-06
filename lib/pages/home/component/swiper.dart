import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/models/slider.dart' as Slides;

class TabSwiperBanner extends StatelessWidget {
  final List<Slides.Slider> banners;
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
            print(banners[index].image);
            return MyCachedNetworkImage(
              imageurl: banners[index].image,
            );
          },
          itemCount: banners.length,
          curve: Curves.easeIn,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('$index'),
        ),
      ),
    );
  }
}
