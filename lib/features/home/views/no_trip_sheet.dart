import 'package:flutter/material.dart';
import 'package:shuttlers_test/features/home/widgets/white_sheet_widget.dart';

import '../../../application/app_view/app_view.dart';

class NoTripSheet extends StatelessWidget {
  const NoTripSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32), 
          const Image(
            image: AssetsMg.noTripMap,
            height: 74,
            width: 74,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(88, 29, 88, 0),
            child: Text(
              'You don’t have any upcoming trips',
              textAlign: TextAlign.center,
              style: StyleMg.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(48, 24, 48, 56),
            child: Text(
              'Your upcoming and active trips will '
              'appear here when they are available.',
              textAlign: TextAlign.center,
              style: StyleMg.subtext,
            ),
          ),
        ],
      ),
    );
  }
}
