import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';

class WhiteSheet extends StatelessWidget {
  const WhiteSheet({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsMg.backgroundWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(SizeMg.radius(40)),
        ),
      ),
      constraints: const BoxConstraints.tightFor(width: double.maxFinite),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizeMg.width(48),
            height: SizeMg.height(4),
            margin: EdgeInsets.only(
              top: SizeMg.padV(8),
              bottom: SizeMg.padV(16),
            ),
            decoration: const BoxDecoration(
              color: ColorsMg.grey10,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
