import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//TODO
class SvgIcons {
  SvgIcons._();
  static SvgPicture _svgAsset24dp(String assetPath) {
    print(assetPath);
    return SvgPicture.asset(assetPath, width: 20, height: 20);
  }

  static const notifications = Icons.notifications;

  static Widget get cubeOutline =>
      _svgAsset24dp('assets/icons/cube-outline.svg');

  static Widget get arrowRight =>
      _svgAsset24dp('assets/icons/ios-arrow-dropright.svg');

  static Widget get arrowBack =>
      _svgAsset24dp('assets/icons/ios-arrow-round-back.svg');

  static Widget get cartSelected =>
      _svgAsset24dp('assets/icons/ios-cart-selected.svg');

  static Widget get cart => _svgAsset24dp('assets/icons/ios-cart.svg');

  static Widget get checkmark =>
      _svgAsset24dp('assets/icons/ios-checkmark-outline.svg');

  static Widget get settings => _svgAsset24dp('assets/icons/ios-cog.svg');

  static Widget get heartSelected =>
      _svgAsset24dp('assets/icons/ios-heart-selected.svg');

  static Widget get heart => _svgAsset24dp('assets/icons/ios-heart.svg');

  static Widget get homeSelected =>
      _svgAsset24dp('assets/icons/ios-home-selected.svg');

  static Widget get home => _svgAsset24dp('assets/icons/ios-home.svg');

  static Widget get categorySelected =>
      _svgAsset24dp('assets/icons/ios-list-selected.svg');

  static Widget get category => _svgAsset24dp('assets/icons/ios-list.svg');

  static Widget get logOut => _svgAsset24dp('assets/icons/ios-log-out.svg');

  static Widget get man => _svgAsset24dp('assets/icons/ios-man.svg');

  static Widget get send =>
      _svgAsset24dp('assets/icons/ios-paperplane-outline.svg');

  static Widget get personSelected =>
      _svgAsset24dp('assets/icons/ios-person-selected.svg');

  static Widget get person => _svgAsset24dp('assets/icons/ios-person.svg');

  static Widget get search => _svgAsset24dp('assets/icons/ios-search.svg');

  static Widget get woman => _svgAsset24dp('assets/icons/ios-woman.svg');

  static Widget get thumbnail => _svgAsset24dp('assets/icons/picture.svg');

  static Widget get phone => _svgAsset24dp('assets/icons/telephone.svg');
}
