import 'package:flutter/material.dart';
import 'package:shuttlers_test/features/home/widgets/white_sheet_widget.dart';

import '../../../application/app_view/style_manager.dart';
import '../../../shared/widgets/app_loading_indicator_widget.dart';

class CheckingTripSheet extends StatelessWidget {
  const CheckingTripSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const AppLoadingIndicator(),
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
