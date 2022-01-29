import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/app_view/app_view.dart';
import '../../../../application/app_view_model/app_view_model.dart';
import '../../../../application/app_view_model/vm_state_enum.dart';
import '../../domain/models/trip_model.dart';
import 'home_view_model.dart';

class HomeMapViewModel extends AppViewModel {
  // final GoogleMapPolyline _polylineSource;
  late GoogleMapController _mapController;
  late final String _mapStyle;
  bool _initialized = false;
  HomeVmState tripState = HomeVmState.none;

  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  HomeMapViewModel() {
    setState(VmState.busy);
  }

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
    setState(VmState.none);
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
        markerId: const MarkerId('bus_location'),
        position: const LatLng(7.1343629, -356.6607876),
        icon: AssetsMg.busMapMarker,
        anchor: const Offset(0.5, 0.5),
        flat: true,
      ),
    );

    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        trip.startStop.location.toLatLng(),
        20,
      ),
    );

    setState();
    _makePolyLines(trip);
  }

  void _makePolyLines(Trip trip) async {
    _polylines.clear();
    final polylineCoordinates = <LatLng>[];
    for (List points in _points) {
      final point = LatLng(
        points[1],
        points[0],
      );
      polylineCoordinates.add(point);
    }
    final polyline = Polyline(
      polylineId: const PolylineId('single'),
      points: polylineCoordinates,
      color: ColorsMg.grey5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 4,
    );
    _polylines.add(polyline);
    _mapController
        .animateCamera(CameraUpdate.newLatLng(polylineCoordinates.first));
    setState();
  }
}

const _points = [
  [-356.6608062, 7.1350419],
  [-356.6658511, 7.1360164],
  [-356.6664340, 7.1362012],
  [-356.6669121, 7.1366184],
  [-356.6669113, 7.1372190],
  [-356.6653672, 7.1385134],
  [-356.6641958, 7.1394918],
  [-356.6628688, 7.1403355],
  [-356.6615245, 7.1412969],
  [-356.6601070, 7.1422058],
];



  // Future<void> _makePolyLines(Trip trip) async {
  //   _polylines.clear();
  //   final stops = trip.stops.toList();
  //   for (int i = 1; i < stops.length; i++) {
  //     try {
  //       final points = await _polylineSource.getCoordinatesWithLocation(
  //         origin: stops[i - 1].location.toLatLng(),
  //         destination: stops[i].location.toLatLng(),
  //         mode: RouteMode.driving,
  //       );
  //       final polyline = Polyline(
  //         polylineId: PolylineId(stops[i - 1].name),
  //         points: points ?? [],
  //         color: ColorsMg.grey6,
  //         startCap: Cap.roundCap,
  //         endCap: Cap.roundCap,
  //         width: 4,
  //       );
  //       _polylines.add(polyline);

  //       setState();
  //     } catch (e) {
  //       //
  //     }
  //   }
  // }

  // Future<void> _makePolyLines(Trip trip) async {
  //   _polylines.clear();
  //   final polylinePoints = PolylinePoints();
  //   final stops = trip.stops.toList();
  //   for (int i = 1; i < stops.length; i++) {
  //     List<LatLng> polylineCoordinates = [];
  //     try {
  //       final result = await polylinePoints.getRouteBetweenCoordinates(
  //         Constants.googleMapsApiKey,
  //         PointLatLng(stops[i - 1].location.lat, stops[i - 1].location.lng),
  //         PointLatLng(stops[i].location.lat, stops[i].location.lng),
  //         travelMode: TravelMode.walking,
  //       );

  //       if (result.points.isNotEmpty) {
  //         for (var point in result.points) {
  //           polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //         }
  //         final polyline = Polyline(
  //           polylineId: PolylineId(stops[i - 1].name),
  //           points: polylineCoordinates,
  //           color: ColorsMg.grey6,
  //           startCap: Cap.roundCap,
  //           endCap: Cap.roundCap,
  //           width: 4,
  //         );
  //         _polylines.add(polyline);
  //       }
  //       setState();
  //     } catch (e) {
  //       //TODO Handle failure
  //       debugPrint('GOOGLE MAPS POLYLINE FAILED -$e');
  //     }
  //   }
  // }