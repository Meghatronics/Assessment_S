import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';

class BlackStartToEndSummary extends StatelessWidget {
  const BlackStartToEndSummary({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  final String start;
  final String end;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeMg.height(40),
      alignment: Alignment.center,
      color: ColorsMg.black1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            start,
            style: StyleMg.medium14.copyWith(
              color: ColorsMg.backgroundWhite,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: ColorsMg.primary,
              size: 16,
            ),
          ),
          Text(
            end,
            style: StyleMg.medium14.copyWith(
              color: ColorsMg.backgroundWhite,
            ),
          ),
        ],
      ),
    );
  }
}
