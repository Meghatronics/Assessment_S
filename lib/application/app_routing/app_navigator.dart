import 'package:flutter/material.dart';

import '../../shared/widgets/app_loading_indicator_widget.dart';
export 'app_routes.dart';

abstract class AppNavigator {
  static final key = GlobalKey<NavigatorState>();
  static BuildContext get currentContext => key.currentState!.context;

  static bool get canPop => key.currentState!.canPop();

  static Future push(String routeName, {dynamic arguments}) {
    return key.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static Future pushNamed(String route, {arguments}) {
    return key.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedReplacement(String route, {arguments}) {
    return key.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  static Future pushNamedAndClear(String route, {arguments}) {
    return key.currentState!.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<bool> maybePop([result]) {
    if (canPop) {
      return key.currentState!.maybePop(result);
    } else {
      return Future.value(false);
    }
  }

  static void showLoadingIndicator() {
    key.currentState!.overlay!.insert(_loadingOverlay);
  }

  static void removeLoadingIndicator([result]) {
    _loadingOverlay.remove();
  }

  static void pop([result]) {
    if (canPop) return key.currentState!.pop(result);
  }

  static final _loadingOverlay = OverlayEntry(
    builder: (_) => const AppLoadingView(),
  );
}
