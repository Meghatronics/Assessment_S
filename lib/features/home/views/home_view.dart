import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../application/app_view/app_view.dart';
import '../view_models/home_view_model.dart';
import '../widgets/trip_action_button_widget.dart';
import '../widgets/white_sheet_widget.dart';
import 'checking_trip_sheet.dart';
import 'next_trip_sheet.dart';
import 'no_trip_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: AppViewBuilder<HomeViewModel>(
        model: AppDependencies.locate(),
        initState: (model) => model.checkForTrip(),
        builder: (model, _) => SlidingSheet(
          color: Colors.transparent,
          backdropColor: Colors.transparent,
          cornerRadius: SizeMg.radius(40),
          cornerRadiusOnFullscreen: 40,
          controller: model.sheetController,
          listener: (snapState) {
            model.setState();
          },
          snapSpec: model.state.snapSpec,
          body: const Placeholder(),
          builder: (_, sheetState) => _SheetView(model, sheetState: sheetState),
          headerBuilder: (_, sheetState) => sheetState.isCollapsed
              ? _SheetHeadButton(model, sheetState: sheetState)
              : const SizedBox.shrink(),
          // footerBuilder: (_, sheetState) =>
          //     _SheetFooter(model, sheetState: sheetState),
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
      // TODO: Handle this case.
      // break;
      case HomeVmState.atStop:
      // TODO: Handle this case.
      // break;
      case HomeVmState.atEnd:
        // TODO: Handle this case.
        child = WhiteSheet(
          children: [
            SizedBox(height: SizeMg.height(300)),
          ],
        );
      // break;
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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [child],
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
    switch (model.state) {
      case HomeVmState.none:
        return const SizedBox.shrink();
      case HomeVmState.checkingTrip:
        return const CheckingTripSheet();
      case HomeVmState.noTrip:
        return const NoTripSheet();
      case HomeVmState.atStart:
        // TODO: Handle this case.
        break;
      case HomeVmState.driving:
        // TODO: Handle this case.
        break;
      case HomeVmState.atStop:
        // TODO: Handle this case.
        break;
      case HomeVmState.atEnd:
        // TODO: Handle this case.
        break;
    }
    return SizedBox(height: 600);
  }
}
