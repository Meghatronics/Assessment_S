import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../application/app_view/app_view.dart';
import '../view_models/home_view_model.dart';
import '../widgets/black_start_to_end_summary_widget.dart';
import '../widgets/swipe_button_widget.dart';
import '../widgets/trip_action_button_widget.dart';
import 'home_map_view.dart';
import 'home_sheets/at_stop_trip_sheet.dart';
import 'home_sheets/checking_trip_sheet.dart';
import 'home_sheets/driving_sheet.dart';
import 'home_sheets/end_trip_sheet.dart';
import 'home_sheets/next_trip_sheet.dart';
import 'home_sheets/no_trip_sheet.dart';

bool isCollapsed = false;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppViewBuilder<HomeViewModel>(
        model: AppDependencies.locate(),
        initState: (model) => model.checkForTrip(),
        builder: (model, _) => SlidingSheet(
          color: Colors.transparent,
          backdropColor: Colors.transparent,
          cornerRadius: SizeMg.radius(40),
          cornerRadiusOnFullscreen: SizeMg.radius(40),
          isBackdropInteractable: true,
          controller: model.sheetController,
          listener: (snapState) {
            if (snapState.isCollapsed != isCollapsed) model.setState();
            isCollapsed = snapState.isCollapsed;
          },
          snapSpec: model.state.snapSpec,
          body: const HomeMapView(),
          builder: (_, sheetState) => _SheetView(model, sheetState: sheetState),
          headerBuilder: (_, sheetState) => sheetState.isCollapsed
              ? _SheetHeadButton(model, sheetState: sheetState)
              : const SizedBox.shrink(),
          footerBuilder: (_, sheetState) => !sheetState.isCollapsed ||
                  [4, 5, 6].any((e) => e == model.state.index)
              ? _SheetFooter(model, sheetState: sheetState)
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _SheetView extends StatelessWidget {
  const _SheetView(
    this.model, {
    required this.sheetState,
    Key? key,
  }) : super(key: key);

  final HomeViewModel model;
  final SheetState sheetState;
  @override
  Widget build(BuildContext context) {
    late Widget child;
    switch (model.state) {
      case HomeVmState.none:
        child = const SizedBox.shrink();
        break;
      case HomeVmState.checkingTrip:
        child = const CheckingTripSheet();
        break;
      case HomeVmState.noTrip:
        child = const NoTripSheet();
        break;
      case HomeVmState.atStart:
        child = const NextTripSheet();
        break;
      case HomeVmState.driving:
        child = DrivingSheet(stopName: model.currentStopName);
        break;
      case HomeVmState.atStop:
        child = AtStopTripSheet(stopName: model.currentStopName);
        break;
      case HomeVmState.atEnd:
        child = AtEndTripSheet(stopName: model.currentStopName);
        break;
    }
    return child;
  }
}

class _SheetHeadButton extends StatelessWidget {
  const _SheetHeadButton(
    this.model, {
    required this.sheetState,
    Key? key,
  }) : super(key: key);

  final HomeViewModel model;
  final SheetState sheetState;
  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (model.state) {
      case HomeVmState.none:
      case HomeVmState.checkingTrip:
      case HomeVmState.noTrip:
      case HomeVmState.driving:
        return const SizedBox.shrink();
      case HomeVmState.atStart:
        child = TripActionWidget(
          onPressed: model.startTrip,
          label: 'Start Trip',
        );
        break;
      case HomeVmState.atStop:
        child = TripActionWidget(
          onPressed: model.continueTrip,
          label: 'Continue trip',
        );
        break;

      case HomeVmState.atEnd:
        child = TripActionWidget(
          onPressed: model.endTrip,
          label: 'End Trip',
          red: true,
        );
        break;
    }
    return child is SizedBox
        ? child
        : TweenAnimationBuilder<Offset>(
            tween: Tween(
              begin: Offset(-SizeMg.height(32), SizeMg.height(32)),
              end: Offset.zero,
            ),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 400),
            builder: (_, offset, __) => Transform.translate(
              offset: offset,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [child],
              ),
            ),
          );
  }
}

class _SheetFooter extends StatelessWidget {
  const _SheetFooter(
    this.model, {
    required this.sheetState,
    Key? key,
  }) : super(key: key);

  final HomeViewModel model;
  final SheetState sheetState;

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (model.state) {
      case HomeVmState.none:
      case HomeVmState.checkingTrip:
      case HomeVmState.noTrip:
        child = const SizedBox.shrink();

        break;
      case HomeVmState.atStart:
        child = SwipeButtonWidget(
          label: 'Start Trip',
          onSwipe: model.startTrip,
        );
        break;
      case HomeVmState.driving:
        child = const BlackStartToEndSummary(
          start: 'Chevron Lekki II',
          end: 'Sandfill, Lekki I',
        );
        break;
      case HomeVmState.atStop:
        child = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BlackStartToEndSummary(
              start: 'Chevron Lekki II',
              end: 'Sandfill, Lekki I',
            ),
            if (!sheetState.isCollapsed)
              SwipeButtonWidget(
                label: 'Continue trip',
                onSwipe: model.continueTrip,
              ),
          ],
        );
        break;
      case HomeVmState.atEnd:
        child = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BlackStartToEndSummary(
              start: 'Chevron Lekki II',
              end: 'Sandfill, Lekki I',
            ),
            if (!sheetState.isCollapsed)
              SwipeButtonWidget(
                label: 'End trip',
                onSwipe: model.endTrip,
                color: ColorsMg.redDefault,
                labelColor: ColorsMg.backgroundWhite,
              ),
          ],
        );
        break;
    }
    return child is SizedBox
        ? child
        : TweenAnimationBuilder<Offset>(
            tween: Tween(
              begin: Offset(-SizeMg.width(375), 0),
              end: Offset.zero,
            ),
            duration: const Duration(milliseconds: 200),
            builder: (_, offset, __) => Transform.translate(
              offset: offset,
              child: child,
            ),
          );
  }
}
