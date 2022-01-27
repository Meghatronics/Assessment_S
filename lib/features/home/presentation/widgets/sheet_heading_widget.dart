import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';

class SheetHeadingWidget extends StatelessWidget {
  const SheetHeadingWidget({
    Key? key,
    required this.heading,
    this.subHeading,
  }) : super(key: key);

  final String heading;
  final String? subHeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeMg.padH(20.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: heading,
                style: StyleMg.title,
                children: [
                  if (subHeading != null)
                    TextSpan(
                      text: ' • $subHeading',
                      style: StyleMg.title.copyWith(
                        color: ColorsMg.grey4,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(width: SizeMg.padH(16)),
          Image(
            image: AssetsMg.shuttlerBus,
            height: SizeMg.height(33),
            width: SizeMg.width(31),
          )
        ],
      ),
    );
  }
}
