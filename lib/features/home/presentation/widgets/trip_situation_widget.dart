import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';
import '../view_models/home_view_model.dart';

class TripSituationWidget extends StatelessWidget {
  const TripSituationWidget({Key? key, required this.tripState})
      : super(key: key);
  final HomeVmState tripState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              color: ColorsMg.green,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(SizeMg.radius(16)),
                topLeft: Radius.circular(SizeMg.radius(16)),
                bottomRight: Radius.circular(SizeMg.radius(16)),
                bottomLeft: Radius.zero,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeMg.padH(20),
              vertical: SizeMg.padV(12),
            ),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: SizeMg.radius(32),
                  child: _TripSituationIcon(
                    driving: tripState == HomeVmState.driving,
                  ),
                ),
                SizedBox(width: SizeMg.padH(20)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Arrived at BABAVSBDS',
                        style: StyleMg.medium14.copyWith(
                          color: ColorsMg.primaryLighter,
                        ),
                      ),
                      SizedBox(height: SizeMg.padV(4)),
                      Text(
                        'Osapa London',
                        style: StyleMg.alt0medium.copyWith(
                          color: ColorsMg.backgroundWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          decoration: BoxDecoration(
            color: ColorsMg.greenDark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(SizeMg.radius(16)),
              bottomRight: Radius.circular(SizeMg.radius(16)),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeMg.padH(16),
            vertical: SizeMg.padV(12),
          ),
          child: Text(
            'data',
            style: StyleMg.medium14.copyWith(
              color: ColorsMg.backgroundWhite,
            ),
          ),
        )
      ],
    );
  }
}

class _TripSituationIcon extends StatelessWidget {
  const _TripSituationIcon({Key? key, required this.driving}) : super(key: key);
  final bool driving;
  @override
  Widget build(BuildContext context) {
    if (driving) {
      return const Icon(
        Icons.arrow_upward_rounded,
        color: ColorsMg.primaryLighter,
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(
              color: ColorsMg.primaryLighter,
            ),
          ),
        ),
        child: Container(
          height: 9,
          margin: const EdgeInsets.all(11),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
