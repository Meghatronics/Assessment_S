import 'package:flutter/material.dart';

import '../../../../../application/app_view/app_view.dart';
import '../../widgets/passenger_at_stop_widget.dart';
import '../../widgets/sheet_heading_widget.dart';
import '../../widgets/trip_itinerary_widget.dart';
import '../../widgets/trip_summary_widget.dart';
import '../../widgets/view_manifest_button_widget.dart';
import '../../widgets/white_sheet_widget.dart';

class AtStopTripSheet extends StatelessWidget {
  const AtStopTripSheet({Key? key, required this.stopName}) : super(key: key);
  final String stopName;
  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      children: [
        // Heading
        SheetHeadingWidget(heading: 'Arrived at $stopName'),
        // Trip Summary
        TripSummaryWidget(chips: const [
          TripSummaryChip.person(label: '10 Pickups'),
          TripSummaryChip.person(label: '10 Dropoffs'),
          TripSummaryChip.time(label: '10 mins away'),
        ]),
        // Divider
        const Divider(),
        // Passengers for stop
        PassengersAtStopWidget(
          stopName: stopName,
        ),
        // Grey Space
        Container(
          height: 16,
          color: ColorsMg.grey11,
          margin: EdgeInsets.only(bottom: SizeMg.padV(16)),
        ),
        // Trip Itinerary
        const TripItineraryWidget(),
        // View Manifest button
        const ViewManifestButton()
      ],
    );
  }
}
