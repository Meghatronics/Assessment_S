import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/app_view/assets_manager.dart';
import 'location_model.dart';
import 'passenger_model.dart';

enum TripStopType {
  start,
  stop,
  end,
}

extension TripStopTypeIcon on TripStopType {
  BitmapDescriptor get icon {
    switch (this) {
      case TripStopType.start:
        return AssetsMg.startMapMarker;
      case TripStopType.stop:
        return AssetsMg.stopMapMarker;
      case TripStopType.end:
        return AssetsMg.endMapMarker;
    }
  }
}

class TripStop {
  final TripStopType type;
  final String name;
  final Location location;

  final Set<Passenger> pickUps;
  final Set<Passenger> dropOffs;

  TripStop({
    required this.name,
    required this.location,
    required this.pickUps,
    required this.dropOffs,
    this.type = TripStopType.stop,
  });

  int get passengerCount => pickUpsCount + dropOffsCount;
  int get pickUpsCount => pickUps.length;
  int get dropOffsCount => dropOffs.length;

  factory TripStop.fromJson(Map<String, dynamic> json, TripStopType type) {
    final name = json['name'];
    final latLng = Location.fromJson(json['lat_lng']);
    final pickUps = <Passenger>{};
    if (json['pick_ups'] != null) {
      json['pick_ups'].forEach((v) {
        pickUps.add(Passenger.fromJson(v));
      });
    }
    final dropOffs = <Passenger>{};
    if (json['drop_offs'] != null) {
      json['drop_offs'].forEach((v) {
        dropOffs.add(Passenger.fromJson(v));
      });
    }

    return TripStop(
      name: name,
      type: type,
      location: latLng,
      pickUps: pickUps,
      dropOffs: dropOffs,
    );
  }

  Marker toMapMarker() {
    return Marker(
      markerId: MarkerId(location.lat.toString()),
      position: location.toLatLng(),
      icon: type.icon,
      flat: true,
      anchor: const Offset(0.5, 0.5),
    );
  }
}
