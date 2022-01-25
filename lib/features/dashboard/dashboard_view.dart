import 'package:flutter/material.dart';

import '../../application/app_view/assets_manager.dart';
import 'custom_nav_bar.dart';
import 'dashboard_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  static final navBar = GlobalKey<CustomNavBarState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          Future.value(false), //TODO: Implement unintentional app quit blocking
      child: Scaffold(
        body: Navigator(
          key: DashboardRouter.instance.key,
          onGenerateRoute: DashboardRouter.instance.route,
          initialRoute: dashboardHomeRoute,
        ),
        bottomNavigationBar: CustomNavBar(
          key: navBar,
          profileImage: AssetsMg.homeIcon,
        ),
      ),
    );
  }
}
