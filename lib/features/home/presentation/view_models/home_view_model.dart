import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../application/app_view/size_manager.dart';
import '../../../../application/app_view_model/app_view_model.dart';
import 'home_map_view_model.dart';

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
          snappings: [SizeMg.height(112), SizeMg.height(336)],
          positioning: SnapPositioning.pixelOffset,
          initialSnap: SizeMg.height(112),
        );
      case HomeVmState.atStop:
        return SnapSpec(
          snap: true,
          snappings: [SizeMg.height(360 + 56 + 16), SizeMg.height(584)],
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

class HomeViewModel extends AppViewModel {
  HomeVmState _state = HomeVmState.none;
  final SheetController _sheetController;
  final HomeMapViewModel mapViewModel;

  HomeViewModel({
    required this.mapViewModel,
  }) : _sheetController = SheetController();

  HomeVmState get state => _state;
  SheetController get sheetController => _sheetController;
  String get stopName => _stopName;
  String _stopName = 'Osapa London';

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
    _changeState(HomeVmState.driving);
    Future.delayed(const Duration(seconds: 4), () {
      _changeState(HomeVmState.atStop);
    });
  }

  void continueTrip() {
    //TODO Implement ContinueTrip
    if (_stopName == 'Osapa London') {
      _stopName = 'Sandfill, Lekki';
      startTrip();
    } else {
      _changeState(HomeVmState.driving);
      Future.delayed(const Duration(seconds: 4), () {
        _changeState(HomeVmState.atEnd);
      });
    }
  }

  void endTrip() {
    //TODO Implement EndTrip
  }
}
