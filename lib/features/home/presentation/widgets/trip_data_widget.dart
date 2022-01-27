import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';

class TripDataWidget extends StatelessWidget {
  const TripDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeMg.padH(20.0)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: SizeMg.radius(15),
              left: (SizeMg.radius(15) / 2) - SizeMg.width(3) / 2,
              width: SizeMg.width(3),
              bottom: (SizeMg.radius(15) + SizeMg.padV(8.0)),
              child: const DecoratedBox(
                // constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ColorsMg.greenDark, ColorsMg.primary],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                _TripDataRow.takeoff(
                  stopName: 'Chevron',
                  child: Text(
                    'Takeoff\n'
                    '8AM, July 5 2021',
                    textAlign: TextAlign.end,
                    style: StyleMg.alt5regular,
                  ),
                ),
                _TripDataRow.destination(
                  stopName: 'Chevron',
                  child: Text(
                    'Around 10:51AM',
                    style: StyleMg.alt5regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TripDataRow extends StatelessWidget {
  const _TripDataRow.takeoff({
    Key? key,
    required this.stopName,
    required this.child,
  })  : _bulletColor = ColorsMg.greenDark,
        super(key: key);

  const _TripDataRow.destination({
    Key? key,
    required this.stopName,
    required this.child,
  })  : _bulletColor = ColorsMg.primary,
        super(key: key);

  final String stopName;
  final Widget child;
  final Color _bulletColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeMg.padV(8.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: SizeMg.radius(15),
            child: Center(
              child: ImageIcon(
                AssetsMg.busIconRounded,
                color: _bulletColor,
                size: SizeMg.radius(16),
              ),
            ),
          ),
          SizedBox(width: SizeMg.padH(6)),
          Expanded(child: Text(stopName, style: StyleMg.alt4medium)),
          SizedBox(width: SizeMg.padH(6)),
          child,
        ],
      ),
    );
  }
}
