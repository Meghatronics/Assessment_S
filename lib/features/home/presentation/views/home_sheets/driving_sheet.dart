import 'package:flutter/material.dart';
import 'package:shuttlers_test/application/app_view/app_view.dart';
import 'package:shuttlers_test/features/home/presentation/widgets/trip_itinerary_widget.dart';
import 'package:shuttlers_test/features/home/presentation/widgets/view_manifest_button_widget.dart';

import '../../widgets/sheet_heading_widget.dart';
import '../../widgets/trip_summary_widget.dart';
import '../../widgets/white_sheet_widget.dart';

class DrivingSheet extends StatelessWidget {
  const DrivingSheet({Key? key, required this.stopName}) : super(key: key);

  final String stopName;
  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      children: [
        // Heading
        SheetHeadingWidget(heading: 'Driving to $stopName'),
        // Trip Summary
        TripSummaryWidget(chips: const [
          TripSummaryChip.person(label: '10 Pickups'),
          TripSummaryChip.person(label: '10 Dropoffs'),
          TripSummaryChip.time(label: '10 mins away'),
        ]),
        //Grey Space
        Container(
          height: 16,
          color: ColorsMg.grey11,
          margin: EdgeInsets.only(bottom: SizeMg.padV(16)),
        ),
        //Trip itinerary
        const TripItineraryWidget(),
        // View Manifest Button
        const ViewManifestButton(),
      ],
    );
  }
}
