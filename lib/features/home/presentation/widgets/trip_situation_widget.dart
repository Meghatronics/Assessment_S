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
                bottomLeft: (tripState != HomeVmState.atEnd)
                    ? Radius.zero
                    : Radius.circular(SizeMg.radius(16)),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeMg.padH(20),
              vertical: SizeMg.padV(12),
            ),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: SizeMg.width(32),
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
                        tripState == HomeVmState.atStop
                            ? 'Arrived at Stop 1'
                            : tripState == HomeVmState.atEnd
                                ? 'Arrived at Destination'
                                : 'Next Bustop',
                        style: StyleMg.medium14.copyWith(
                          color: ColorsMg.primaryLighter,
                        ),
                      ),
                      SizedBox(height: SizeMg.padV(2)),
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
        if (tripState != HomeVmState.atEnd)
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
              tripState == HomeVmState.atStop
                  ? 'Next Stop: Agungi'
                  : '3 min • 100 KM',
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
      return Icon(
        Icons.arrow_upward_rounded,
        color: ColorsMg.primaryLighter,
        size: SizeMg.width(30),
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
          height: SizeMg.width(9),
          width: SizeMg.width(9),
          margin: EdgeInsets.all(SizeMg.width(11)),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
