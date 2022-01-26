import 'package:flutter/material.dart';

import '../widgets/passenger_at_stop_widget.dart';
import '../widgets/sheet_heading_widget.dart';
import '../widgets/trip_summary_widget.dart';
import '../widgets/white_sheet_widget.dart';

class NextTripSheet extends StatelessWidget {
  const NextTripSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      children: [
        // Heading widget
        const SheetHeadingWidget(
          heading: 'Next Trip',
          subHeading: 'Starts in 5 mins',
        ),

        // Start to stop summary

        //DIVIDER
        const Divider(),
        // Trip summary
        TripSummaryWidget(chips: const [
          TripSummaryChip.person(label: '24 Passengers'),
          TripSummaryChip.location(label: '10 Stops'),
          TripSummaryChip.time(label: '2hr 30mins'),
        ]),
        //GREY SPACE
        // Trip itinerary

        // View Manifest button

        const PassengersAtStopWidget(
          stopName: 'Osapa London',
        )
      ],
      // ),
    );
  }
}
