import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageurl;
  const MyCachedNetworkImage({Key key, this.imageurl}) : super(key: key);
  // TODO - add placeholder image
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageurl ??
          "http://192.168.137.181:81/assets/images/defaults/slider.png",
      placeholder: (_, __) => Center(
        child: Text(
          'placeholder-image',
          style: TextStyle(fontSize: 9),
        ),
      ),
      errorWidget: (_, error, __) => Center(
        child: Text('placeholder-image'),
      ),
      fit: BoxFit.cover,
    );
  }
}
