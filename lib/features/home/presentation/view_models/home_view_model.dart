import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../application/app_view/size_manager.dart';
import '../../../../application/app_view_model/app_view_model.dart';
import '../../domain/enums/home_vm_state_enum.dart';
import '../../domain/models/trip_model.dart';
import 'home_map_view_model.dart';

export '../../domain/enums/home_vm_state_enum.dart';

class HomeViewModel extends AppViewModel {
  HomeVmState _state = HomeVmState.none;
  final SheetController _sheetController;
  final HomeMapViewModel mapViewModel;

  Trip? _trip;
  String _stopName = 'Osapa London';

  HomeViewModel({
    required this.mapViewModel,
  }) : _sheetController = SheetController();

  HomeVmState get state => _state;
  SheetController get sheetController => _sheetController;
  String get currentStopName => _stopName;
  String get tripStartPoint => _trip?.startStop.name ?? '';
  String get tripDestinationPoint => _trip?.destinationStop.name ?? '';

  void _changeState(HomeVmState newState) {
    _state = newState;
    mapViewModel.update(_state);
    setState();
    _sheetController.snapToExtent(
      _state.snapSpec.initialSnap ?? _state.snapSpec.minSnap,
    );
  }

  void checkForTrip() {
    if (_state == HomeVmState.none || _state == HomeVmState.noTrip) {
      _checkForTrip();
    }
  }

  Future<void> _checkForTrip() async {
    _changeState(HomeVmState.checkingTrip);
    await Future.delayed(const Duration(seconds: 2));
    _changeState(HomeVmState.noTrip);
    await Future.delayed(const Duration(seconds: 4));
    _changeState(HomeVmState.checkingTrip);
    await Future.delayed(const Duration(seconds: 1));
    // Fetch trip
    _trip = await Trip.demo();
    if (_trip != null) {
      mapViewModel.foundTrip(_trip!);
    }
    _changeState(HomeVmState.atStart);
  }

  void startTrip() {
    //TODO Implement StartTrip
    _changeState(HomeVmState.driving);
    Future.delayed(const Duration(seconds: 4), () {
      _changeState(HomeVmState.atStop);
    });
  }

  void continueTrip() {
    //TODO Implement ContinueTrip
    if (_stopName == 'Osapa London') {
      _stopName = 'Lagoon front';
      startTrip();
    } else {
      _stopName = 'Sandfill, Lekki';
      _changeState(HomeVmState.driving);
      Future.delayed(const Duration(seconds: 4), () {
        _changeState(HomeVmState.atEnd);
      });
    }
  }

  void endTrip() {
    _changeState(HomeVmState.noTrip);
    AppNavigator.pushNamed(ratePassengersViewRoute);
  }
}

extension HomeVmStateData on HomeVmState {
  SnapSpec get snapSpec {
    switch (this) {
      case HomeVmState.checkingTrip:
        return SnapSpec(
          snap: false,
          snappings: [SizeMg.height(209), SizeMg.height(210)],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(210),
        );
      case HomeVmState.noTrip:
        return SnapSpec(
          snap: false,
          snappings: [SizeMg.height(399), SizeMg.height(400)],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(400),
        );
      case HomeVmState.atStart:
        return SnapSpec(
          snap: true,
          snappings: [
            SizeMg.height(210 + 56 + 16),
            SizeMg.height(434),
            SizeMg.height(536),
          ],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(210 + 56 + 16),
        );

      case HomeVmState.driving:
        return SnapSpec(
          snap: true,
          snappings: [SizeMg.height(152), SizeMg.height(336)],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(152),
        );
      case HomeVmState.atStop:
        return SnapSpec(
          snap: true,
          snappings: [SizeMg.height(360 + 56 + 16), SizeMg.height(584 + 72)],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(360 + 56 + 16),
        );
      case HomeVmState.atEnd:
        return SnapSpec(
          snap: true,
          snappings: [SizeMg.height(360 + 56 + 16), SizeMg.height(584)],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(360 + 56 + 16),
        );
      case HomeVmState.none:
        return const SnapSpec(
          snap: false,
          snappings: [0.3, 0.5],
          positioning: SnapPositioning.relativeToAvailableSpace,
          initialSnap: 0.2,
        );
    }
  }
}
