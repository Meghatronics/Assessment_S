import 'package:flutter/material.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';

import '../../application/app_view/app_view.dart';

class AppLoadingIndicator extends StatelessWidget {
  final bool centered;
  final double radius;
  final int ticks;
  final Color activeColor;
  final Color backColor;

  const AppLoadingIndicator({
    Key? key,
    this.centered = true,
    this.radius = 12,
    this.ticks = 10,
    this.activeColor = ColorsMg.primary,
    this.backColor = ColorsMg.grey10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return centered
        ? Center(
            child: NutsActivityIndicator(
              activeColor: activeColor,
              inactiveColor: backColor,
              tickCount: ticks,
              radius: SizeMg.radius(radius),
            ),
          )
        : NutsActivityIndicator(
            activeColor: activeColor,
            inactiveColor: backColor,
            tickCount: ticks,
            radius: SizeMg.radius(radius),
          );
  }
}

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({Key? key, this.onUserDismiss}) : super(key: key);
  final Future<bool> Function()? onUserDismiss;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onUserDismiss ?? () => Future.value(false),
      child: const Scaffold(
        backgroundColor: Colors.black45,
        body: AppLoadingIndicator(centered: true),
      ),
    );
  }
}
