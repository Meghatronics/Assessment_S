import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AssetsMg {
  const AssetsMg();

  static Future<void> initMapMarkers() async {
    stopMapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/shuttler_bus.png',
    );
    startMapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/shuttler_bus.png',
    );
    endMapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/shuttler_bus.png',
    );
  }

  static const _imagesDir = 'assets/images';
  static const _iconsDir = 'assets/icons';

  //IMAGES
  static const noTripMap = AssetImage('$_imagesDir/no_trip_map.png');
  static const shuttlerBus = AssetImage('$_imagesDir/shuttler_bus.png');
  static const appIcon = AssetImage('$_imagesDir/app_icon.png');
  static const appName = AssetImage('$_imagesDir/app_name.png');

  // ICONS
  static const homeIcon = AssetImage('$_iconsDir/home_icon.png');
  static const routeIcon = AssetImage('$_iconsDir/route_icon.png');
  static const cornerArrowIcon = AssetImage('$_iconsDir/corner_arrow.png');
  static const locationPlusIcon =
      AssetImage('$_iconsDir/location-plus_icon.png');
  static const profileIcon = AssetImage('$_iconsDir/profile_icon.png');
  static const clockIcon = AssetImage('$_iconsDir/clock_icon.png');
  static const starIcon = AssetImage('$_iconsDir/star.png');
  static const busIconRounded = AssetImage('$_iconsDir/bus_icon_rounded.png');
  static const documentIcon = AssetImage('$_iconsDir/document_icon.png');
  static const caretRightIcon = AssetImage('$_iconsDir/caret_right.png');

  // MAP MARKERS
  static late final BitmapDescriptor stopMapMarker;
  static late final BitmapDescriptor startMapMarker;
  static late final BitmapDescriptor endMapMarker;

  // OTHERS
  static const mapStyle = 'assets/map_style.json';
  static const dummyImage =
      NetworkImage('https://randomuser.me/api/portraits/thumb/men/75.jpg');
}
