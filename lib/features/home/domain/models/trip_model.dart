import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/app_routing/app_navigator.dart';
import '../../../../application/app_view/app_view.dart';
import 'trip_stop_model.dart';

class Trip {
  final String id;
  final Set<TripStop> stops;
  final DateTime startTime;
  final int estimateDuration;

  const Trip({
    required this.id,
    required this.stops,
    required this.startTime,
    required this.estimateDuration,
  });

  int get passengerCount {
    int count = 0;
    for (TripStop stop in stops) {
      count += stop.passengerCount;
    }
    return count;
  }

  int get stopCount => stops.length - 2;
  TripStop get startStop => stops.first;
  TripStop get destinationStop => stops.last;

  Polyline toPolyline() {
    return Polyline(
      polylineId: PolylineId(id),
      points: stops.map((stop) => stop.location.toLatLng()).toList(),
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
      color: ColorsMg.grey3,
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    final startTime = json['start_time'];
    final durationInMinutes = json['duration_in_minutes'];
    final stops = <TripStop>{};
    if (json['stops'] != null) {
      json['stops'].forEach((v) {
        if ((json['stops'] as List).first == v) {
          stops.add(TripStop.fromJson(v, TripStopType.start));
        } else if ((json['stops'] as List).last == v) {
          stops.add(TripStop.fromJson(v, TripStopType.end));
        } else {
          stops.add(TripStop.fromJson(v, TripStopType.stop));
        }
      });
    }
    return Trip(
      id: json['id'],
      startTime: DateTime.tryParse(startTime) ??
          DateTime.now().add(const Duration(minutes: 5)),
      estimateDuration: durationInMinutes ?? 70,
      stops: stops,
    );
  }

  static Future<Trip> demo() async {
    final assets = DefaultAssetBundle.of(AppNavigator.key.currentContext!);
    final jsonString = await assets.loadString('assets/demo_trip.json');
    final json = jsonDecode(jsonString);
    final demoTrip = Trip.fromJson(json);
    return demoTrip;
  }
}