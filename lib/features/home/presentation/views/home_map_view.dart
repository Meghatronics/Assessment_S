import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/app_view/app_view.dart';
import '../../../../shared/widgets/app_loading_indicator_widget.dart';
import '../view_models/home_map_view_model.dart';
import '../widgets/trip_situation_widget.dart';

class HomeMapView extends StatelessWidget {
  const HomeMapView({Key? key}) : super(key: key);
  static final mapKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AppViewBuilder<HomeMapViewModel>(
      model: AppDependencies.locate(),
      initState: (model) => model.initialize(context),
      builder: (model, _) => Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: GoogleMap(
              key: mapKey,
              onMapCreated: model.onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              polylines: model.polylines,
              markers: model.markers,
              initialCameraPosition: const CameraPosition(
                target: LatLng(7.1422058, -356.6601070),
                zoom: 15,
              ),
              mapType: MapType.normal,
              minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            ),
          ),
          if (model.isBusy)
            const Align(
              alignment: Alignment(0, -0.5),
              child: AppLoadingIndicator(),
            ),
          Positioned(
            top: SizeMg.padV(48),
            left: SizeMg.padH(20),
            right: SizeMg.padH(20),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: [0, 1, 2, 3].any((e) => model.tripState.index == e)
                  ? Image(
                      image: AssetsMg.appName,
                      height: SizeMg.height(24),
                    )
                  : TripSituationWidget(tripState: model.tripState),
            ),
          ),
        ],
      ),
    );
  }
}
