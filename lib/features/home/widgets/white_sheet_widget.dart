import 'package:flutter/material.dart';

import '../../../application/app_view/app_view.dart';

class WhiteSheet extends StatelessWidget {
  const WhiteSheet({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsMg.backgroundWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      constraints: const BoxConstraints.tightFor(width: double.maxFinite),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 4,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: const BoxDecoration(
              color: ColorsMg.grey10,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          Flexible(child: child),
        ],
      ),
    );
  }
}
