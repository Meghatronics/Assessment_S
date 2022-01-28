import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuttlers_test/features/home/presentation/view_models/home_view_model.dart';

import '../../../../application/app_view/assets_manager.dart';
import '../../../../application/app_view_model/app_view_model.dart';

class HomeMapViewModel extends AppViewModel {
  late GoogleMapController _mapController;
  late final String _mapStyle;
  bool _initialized = false;
  HomeVmState tripState = HomeVmState.none;

  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

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
}
