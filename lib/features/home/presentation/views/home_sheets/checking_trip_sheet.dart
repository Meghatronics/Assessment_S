import 'package:flutter/material.dart';

import '../../../../../application/app_view/app_view.dart';
import '../../../../../shared/widgets/app_loading_indicator_widget.dart';
import '../../widgets/white_sheet_widget.dart';

class CheckingTripSheet extends StatelessWidget {
  const CheckingTripSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      children: /* Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: */
          [
        SizedBox(height: SizeMg.height(24)),
        const AppLoadingIndicator(),
        Padding(
          padding: EdgeInsets.fromLTRB(
            SizeMg.padH(48),
            SizeMg.padV(24),
            SizeMg.padH(48),
            SizeMg.padV(56),
          ),
          child: Text(
            'Your upcoming and active trips will '
            'appear here when they are available.',
            textAlign: TextAlign.center,
            style: StyleMg.subtext,
          ),
        ),
      ],
      // ),
    );
  }
}
