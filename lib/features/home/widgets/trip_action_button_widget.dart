import 'package:flutter/material.dart';

import '../../../application/app_view/app_view.dart';

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
      padding: const EdgeInsets.only(
        bottom: 12.0,
        right: 20.0,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: red ? ColorsMg.redDefault : ColorsMg.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
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
            const SizedBox(width: 8),
            const Image(
              image: AssetsMg.cornerArrowIcon,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
