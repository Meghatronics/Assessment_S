import 'package:flutter/material.dart';

import '../../application/app_view/app_view.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: StyleMg.bold14.copyWith(
          color: ColorsMg.backgroundWhite,
        ),
      ),
      style: TextButton.styleFrom(
        primary: ColorsMg.black1,
        backgroundColor: ColorsMg.black1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeMg.radius(8)),
        ),
        minimumSize: Size.fromHeight(SizeMg.height(48)),
      ),
    );
  }
}
