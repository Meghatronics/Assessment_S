import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/dashboard_view.dart';
import 'app_routes.dart';

class AppRouter {
  static const i = AppRouter._();
  const AppRouter._();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashViewRoute:
        return _getPageRoute(
          settings,
          view: const Scaffold(),
        );
        
      case dashboardRoute:
        return _getPageRoute(
          settings,
          view: const DashboardView(),
        );

      default:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  PageRoute<dynamic> _getPageRoute(RouteSettings routeSettings,
      {required Widget view}) {
    return Platform.isIOS
        ? CupertinoPageRoute<dynamic>(
            settings: routeSettings, builder: (_) => view)
        : MaterialPageRoute<dynamic>(
            settings: routeSettings, builder: (_) => view);
  }
}
