import 'package:flutter/material.dart';

import '../../../application/app_view/app_view.dart';
import '../widgets/white_sheet_widget.dart';

class NoTripSheet extends StatelessWidget {
  const NoTripSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteSheet(
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(height: SizeMg.height(32)),
        Image(
          image: AssetsMg.noTripMap,
          height: SizeMg.radius(74),
          width: SizeMg.radius(74),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            SizeMg.padH(88),
            SizeMg.padV(29),
            SizeMg.padH(88),
            0,
          ),
          child: Text(
            'You don’t have any upcoming trips',
            textAlign: TextAlign.center,
            style: StyleMg.title,
          ),
        ),
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
