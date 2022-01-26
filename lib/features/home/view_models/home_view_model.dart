import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../application/app_view/size_manager.dart';
import '../../../application/app_view_model/app_view_model.dart';

enum HomeVmState {
  none,

  /// App is checking for upcoming trips
  checkingTrip,

  /// Logged in user has no upcoming trips
  noTrip,

  /// Upcoming trip is yet to start. Start Trip buttons and itenery show
  atStart,

  /// Trip is ongoing and Driver is not at a Stop
  driving,

  /// Trip is ongoing and Driver is at a Stop, checking in and out passengers
  atStop,

  /// Trip is completed. End Trip button shows
  atEnd,
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
        return const SnapSpec(
          snap: true,
          snappings: [0.3, 0.6, 0.7],
          positioning: SnapPositioning.relativeToAvailableSpace,
          initialSnap: 0.3,
        );

      case HomeVmState.driving:
        return const SnapSpec(
          snap: true,
          snappings: [0.3, 0.5],
          positioning: SnapPositioning.relativeToAvailableSpace,
          initialSnap: 0.3,
        );
      case HomeVmState.atStop:
        return const SnapSpec(
          snap: true,
          snappings: [0.55, 0.7, 0.85],
          positioning: SnapPositioning.relativeToAvailableSpace,
          initialSnap: 0.55,
        );
      case HomeVmState.atEnd:
        return const SnapSpec(
          snap: true,
          snappings: [0.55, 0.7],
          positioning: SnapPositioning.relativeToAvailableSpace,
          initialSnap: 0.55,
        );
      case HomeVmState.none:
        return const SnapSpec(
          snap: true,
          snappings: [0.3, 0.5],
          positioning: SnapPositioning.relativeToAvailableSpace,
          initialSnap: 0.3,
        );
    }
  }
}

class HomeViewModel extends AppViewModel {
  HomeVmState _state = HomeVmState.none;
  final SheetController _sheetController;

  HomeViewModel() : _sheetController = SheetController();

  HomeVmState get state => _state;
  SheetController get sheetController => _sheetController;

  void _changeState(HomeVmState newState) {
    _state = newState;
    _sheetController.snapToExtent(
      _state.snapSpec.initialSnap ?? _state.snapSpec.minSnap,
    );
    setState();
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
    await Future.delayed(const Duration(seconds: 2));
    _changeState(HomeVmState.checkingTrip);
    await Future.delayed(const Duration(seconds: 2));
    _changeState(HomeVmState.atStart);
  }

  void startTrip() {
    //TODO Implement StartTrip
  }
  void continueTrip() {
    //TODO Implement ContinueTrip
  }
  void endTrip() {
    //TODO Implement EndTrip
  }
}
