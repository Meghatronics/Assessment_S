import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuttlers_test/application/app_view/app_view.dart';

import '../../../../application/app_view/assets_manager.dart';
import '../../../../application/app_view_model/app_view_model.dart';
import '../../../../utilities/constants.dart';
import '../../domain/models/trip_model.dart';
import 'home_view_model.dart';

class HomeMapViewModel extends AppViewModel {
  final GoogleMapPolyline _polylineSource;
  late GoogleMapController _mapController;
  late final String _mapStyle;
  bool _initialized = false;
  HomeVmState tripState = HomeVmState.none;

  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  HomeMapViewModel()
      : _polylineSource = GoogleMapPolyline(apiKey: Constants.googleMapsApiKey);

  // Exposed fields
  UnmodifiableSetView<Polyline> get polylines =>
      UnmodifiableSetView(_polylines);
  UnmodifiableSetView<Marker> get markers => UnmodifiableSetView(_markers);

  void initialize(BuildContext context) {
    if (!_initialized) {
      _fetchMapStyle(context);
      //
    }
    _initialized = true;
  }

  void _fetchMapStyle(BuildContext context) async {
    final mapStyle = await DefaultAssetBundle.of(context).loadString(
      AssetsMg.mapStyle,
    );
    _mapStyle = mapStyle;
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    controller.setMapStyle(_mapStyle);
    setState();
  }

  void update(HomeVmState state) {
    tripState = state;
    setState();
  }

  void foundTrip(Trip trip) {
    final markers = trip.stops.map((e) => e.toMapMarker());
    _markers.clear();
    _markers.addAll(markers);
    _markers.add(
      Marker(
        markerId: MarkerId('bus_location'),
        position: LatLng(7.150340, 3.346080),
        icon: AssetsMg.busMapMarker,
      ),
    );

    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        trip.startStop.location.toLatLng(),
        18,
      ),
    );

    setState();
    _makePolyLines(trip);
  }

  // Future<void> _makePolyLines(Trip trip) async {
  //   _polylines.clear();
  //   final stops = trip.stops.toList();
  //   for (int i = 1; i < stops.length; i++) {
  //     final points = await _polylineSource.getCoordinatesWithLocation(
  //       origin: stops[i - 1].location.toLatLng(),
  //       destination: stops[i].location.toLatLng(),
  //       mode: RouteMode.driving,
  //     );
  //     final polyline = Polyline(
  //       polylineId: PolylineId(stops[i - 1].name),
  //       points: points ?? [],
  //     );
  //     _polylines.add(polyline);
  //   }
  //   setState();
  // }
  Future<void> _makePolyLines(Trip trip) async {
    _polylines.clear();
    final polylinePoints = PolylinePoints();
    final stops = trip.stops.toList();
    for (int i = 1; i < stops.length; i++) {
      List<LatLng> polylineCoordinates = [];

      final result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.googleMapsApiKey,
        PointLatLng(stops[i - 1].location.lat, stops[i - 1].location.lng),
        PointLatLng(stops[i].location.lat, stops[i].location.lng),
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
        final polyline = Polyline(
          polylineId: PolylineId(stops[i - 1].name),
          points: polylineCoordinates,
          color: ColorsMg.grey6,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        );
        _polylines.add(polyline);
      }
      setState();
    }
  }
}
