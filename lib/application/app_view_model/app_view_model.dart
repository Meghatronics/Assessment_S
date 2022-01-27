import 'package:flutter/foundation.dart';

import 'vm_state_enum.dart';

export '../app_routing/app_navigator.dart';

class AppViewModel extends ChangeNotifier {
  VmState _viewState = VmState.none;
  bool _disposed = false;
  //

  VmState get viewState => _viewState;
  bool get hasEncounteredError =>
      _viewState == VmState.error || _viewState == VmState.noConnection;
  bool get isBusy => _viewState == VmState.busy;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  @protected
  void setState([VmState? viewState]) {
    if (viewState != null) _viewState = viewState;
    if (!_disposed && hasListeners) notifyListeners();
  }

  // void handleFailure(
  //   Failure failure, {
  //   Function? retryCallback,
  //   String? title,
  // }) {
  //
  // }
}
