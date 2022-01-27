import 'package:flutter/material.dart';
import '../../widgets/view_manifest_button_widget.dart';

import '../../../../../application/app_view/app_view.dart';
import '../../widgets/sheet_heading_widget.dart';
import '../../widgets/trip_data_widget.dart';
import '../../widgets/trip_itinerary_widget.dart';
import '../../widgets/trip_summary_widget.dart';
import '../../widgets/white_sheet_widget.dart';

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
        SizedBox(height: SizeMg.height(8)),
        //Trip Data
        const TripDataWidget(),

        //Divider
        const Divider(),
        // Trip summary
        TripSummaryWidget(chips: const [
          TripSummaryChip.person(label: '24 Passengers'),
          TripSummaryChip.location(label: '10 Stops'),
          TripSummaryChip.time(label: '2hr 30mins'),
        ]),
        //Grey Space
        Container(
          height: 16,
          color: ColorsMg.grey11,
          margin: EdgeInsets.only(bottom: SizeMg.padV(16)),
        ),
        // Trip itinerary
        const TripItineraryWidget(),
        // View Manifest Button
        const ViewManifestButton(),
      ],
      // ),
    );
  }
}
