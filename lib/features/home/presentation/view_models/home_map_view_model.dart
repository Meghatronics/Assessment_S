import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/app_view/assets_manager.dart';
import '../../../../application/app_view_model/app_view_model.dart';

class HomeMapViewModel extends AppViewModel {
  late final GoogleMapController _mapController;
  late final String _mapStyle;

  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  // Exposed fields
  UnmodifiableSetView<Polyline> get polylines =>
      UnmodifiableSetView(_polylines);
  UnmodifiableSetView<Marker> get markers => UnmodifiableSetView(_markers);

  void initialize(BuildContext context) {
    _fetchMapStyle(context);
    //
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
}
