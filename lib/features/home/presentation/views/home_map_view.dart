import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/app_view/app_view.dart';
import '../view_models/home_map_view_model.dart';

class HomeMapView extends StatelessWidget {
  const HomeMapView({Key? key}) : super(key: key);
  static final mapKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AppViewBuilder<HomeMapViewModel>(
      model: AppDependencies.locate(),
      initState: (model) => model.initialize(context),
      builder: (model, _) => GoogleMap(
        key: mapKey,
        onMapCreated: model.onMapCreated,
        myLocationButtonEnabled: true,
        polylines: model.polylines,
        markers: model.markers,
        initialCameraPosition: const CameraPosition(
          target: LatLng(7.156785, 3.350852),
          zoom: 18,
        ),
        mapType: MapType.terrain,
        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
      ),
    );
  }
}
