import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';

class TripActionWidget extends StatelessWidget {
  const TripActionWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    this.red = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final bool red;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeMg.padV(12.0),
        right: SizeMg.padH(20.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: red ? ColorsMg.redDefault : ColorsMg.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeMg.radius(32)),
            ),
            padding: const EdgeInsets.all(16),
            minimumSize: const Size(104, 56)),
        child: Row(
          children: [
            Text(
              label,
              style: StyleMg.bold14.copyWith(
                color: red ? ColorsMg.backgroundWhite : ColorsMg.black1,
              ),
            ),
            SizedBox(width: SizeMg.padH(8)),
            Image(
              image: AssetsMg.cornerArrowIcon,
              height: SizeMg.radius(24),
              width: SizeMg.radius(24),
            ),
          ],
        ),
      ),
    );
  }
}
