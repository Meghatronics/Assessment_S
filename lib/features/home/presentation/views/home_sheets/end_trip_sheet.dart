import 'package:flutter/material.dart';

import '../../widgets/passenger_at_stop_widget.dart';
import '../../widgets/sheet_heading_widget.dart';
import '../../widgets/trip_summary_widget.dart';
import '../../widgets/view_manifest_button_widget.dart';
import '../../widgets/white_sheet_widget.dart';

class AtEndTripSheet extends StatelessWidget {
  const AtEndTripSheet({Key? key, required this.stopName}) : super(key: key);
  final String stopName;
  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      children: [
        // Heading
        const SheetHeadingWidget(heading: 'Arrived at Destination'),
        // Trip Summary
        TripSummaryWidget(chips: const [
          TripSummaryChip.person(label: '10 Pickups'),
          TripSummaryChip.person(label: '10 Dropoffs'),
          TripSummaryChip.time(label: '10 mins away'),
        ]),
        //Divider
        const Divider(),
        //Passengers for stop
        PassengersAtStopWidget(
          stopName: stopName,
        ),
        // View Manifest Button
        const ViewManifestButton(),
      ],
    );
  }
}
