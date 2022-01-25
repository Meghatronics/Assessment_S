import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../application/app_routing/app_router.dart';
import '../../application/app_routing/app_routes.dart';
import '../home/views/home_view.dart';
import 'dashboard_view.dart';

export '../../application/app_routing/app_routes.dart';

class DashboardRouter {
  static final DashboardRouter instance = DashboardRouter._();
  DashboardRouter._();
  final key = GlobalKey<NavigatorState>();

  Future<dynamic> replaceWithNamed(String routeName) async {
    return key.currentState!.pushReplacementNamed(routeName);
  }

  Future<dynamic> pushNamed(String routeName) async {
    return key.currentState!.pushNamed(routeName);
  }

  Future<dynamic> goBack() async {
    if (key.currentState!.canPop()) {
      key.currentState!.maybePop();
    } else {
      DashboardView.navBar.currentState!.navigateToIndex(0);
    }
  }

  // PageRoute<dynamic> _getPageRoute(RouteSettings routeSettings,
  //     {required Widget view}) {
  //   return Platform.isIOS
  //       ? CupertinoPageRoute<dynamic>(
  //           settings: routeSettings, builder: (_) => view)
  //       : MaterialPageRoute<dynamic>(
  //           settings: routeSettings, builder: (_) => view);
  // }

  Route route(RouteSettings settings) {
    switch (settings.name) {
      case dashboardHomeRoute:
        return UnanimatedPageRoute(const HomeView());
      case dashboardRoutesRoute:
      //  return BlankRoute(HomeView());
      case dashboardProfileRoute:
      //  return BlankRoute(HomeView());
      default:
        return AppRouter.i.generateRoute(settings);
    }
  }
}

class UnanimatedPageRoute extends PageRoute {
  final Widget page;

  UnanimatedPageRoute(this.page);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return page;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration.zero;
}
