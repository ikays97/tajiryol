import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageurl;
  const MyCachedNetworkImage({Key key, this.imageurl}) : super(key: key);
  // TODO - add placeholder image
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageurl,
      placeholder: (_, __) => Center(
        child: Text('placeholder-image'),
      ),
      errorWidget: (_, error, __) => Center(
        child: Text('placeholder-image'),
      ),
      fit: BoxFit.cover,
    );
  }
}
