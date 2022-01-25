import 'package:flutter/material.dart';

import '../../../application/app_view/app_view.dart';

class TripSummaryWidget extends StatelessWidget {
  const TripSummaryWidget({Key? key, required this.chips})
      : assert(
          chips.length <= 3,
          'Trip Summary Widget received ${chips.length} chips. Optimized for <=3',
        ),
        super(key: key);

  final List<TripSummaryChip> chips;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: chips,
      ),
    );
  }
}

class TripSummaryChip extends StatelessWidget {
  const TripSummaryChip.person({
    Key? key,
    required this.label,
  })  : _iconImage = AssetsMg.profileIcon,
        super(key: key);

  const TripSummaryChip.location({
    Key? key,
    required this.label,
  })  : _iconImage = AssetsMg.locationPlusIcon,
        super(key: key);

  const TripSummaryChip.time({
    Key? key,
    required this.label,
  })  : _iconImage = AssetsMg.clockIcon,
        super(key: key);

  final String label;
  final AssetImage _iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: ColorsMg.grey11,
      ),
      child: Row(
        children: [
          ImageIcon(
            _iconImage,
            color: ColorsMg.grey5,
            size: 10,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: StyleMg.alt5medium,
          )
        ],
      ),
    );
  }
}
