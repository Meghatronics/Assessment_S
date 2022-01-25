import 'package:flutter/material.dart';

class AssetsMg {
  const AssetsMg();
  static const _imagesDir = 'assets/images';
  static const _iconsDir = 'assets/icons';
  static const _animationsDir = 'assets/animations';

  //IMAGES
  static const noTripMap = AssetImage('$_imagesDir/no_trip_map.png');
  static const shuttlerBus = AssetImage('$_imagesDir/shuttler_bus.png');

  // ICONS
  static const homeIcon = AssetImage('$_iconsDir/home_icon.png');
  static const routeIcon = AssetImage('$_iconsDir/route_icon.png');
  static const cornerArrowIcon = AssetImage('$_iconsDir/corner_arrow.png');
}
