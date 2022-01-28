import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final double lng;
  final double lat;

  Location(
    this.lat,
    this.lng,
  );

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      json['lat'] as double,
      json['long'] as double,
    );
  }

  LatLng toLatLng() => LatLng(lat, lng);
}
