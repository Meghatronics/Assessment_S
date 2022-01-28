import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../application/app_view/app_view.dart';
import '../view_models/home_view_model.dart';

class TripItineraryWidget extends StatefulWidget {
  const TripItineraryWidget({Key? key}) : super(key: key);

  @override
  State<TripItineraryWidget> createState() => _TripItineraryWidgetState();
}

class _TripItineraryWidgetState extends State<TripItineraryWidget> {
  bool _expanded = false;

  void _expand() {
    setState(() {
      _expanded = true;
    });
    SheetController.of(context)?.snapToExtent(
      AppDependencies.locate<HomeViewModel>().state.snapSpec.snappings.last,
    );
  }

  void _collapse() {
    setState(() {
      _expanded = false;
    });
    SheetController.of(context)?.snapToExtent(
      AppDependencies.locate<HomeViewModel>().state.snapSpec.snappings[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeMg.padH(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Trip Itinerary',
                  style: StyleMg.medium14,
                ),
              ),
              if (_expanded)
                InkWell(
                  onTap: _collapse,
                  // style: TextButton.styleFrom(
                  //   fixedSize: Size(
                  //     SizeMg.width(68),
                  //     SizeMg.height(20),
                  //   ),
                  // ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: ColorsMg.grey3,
                        size: SizeMg.text(20),
                      ),
                      Text(
                        'Collapse',
                        style: StyleMg.alt4regular.copyWith(
                          color: ColorsMg.primary,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: SizeMg.padH(8)),
          Flexible(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: SizeMg.radius(15),
                  left: (SizeMg.radius(15) / 2) - SizeMg.width(3) / 2,
                  width: SizeMg.width(3),
                  bottom: (SizeMg.radius(15) + SizeMg.padV(8.0)),
                  child: DecoratedBox(
                    decoration: _expanded
                        ? const BoxDecoration(
                            color: ColorsMg.grey8,
                          )
                        : const BoxDecoration(
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
                    StartItineraryItem(
                      stopName: 'Chevron, Lekki II',
                      pickupCount: 10,
                      parentIsExpanded: _expanded,
                    ),
                    if (_expanded) ...[
                      StopItineraryItem(
                          stopName: 'Obalende',
                          pickupCount: 2,
                          dropoffCount: 3),
                      StopItineraryItem(
                          stopName: 'Obalende',
                          pickupCount: 2,
                          dropoffCount: 3),
                      StopItineraryItem(
                          stopName: 'Obalende',
                          pickupCount: 2,
                          dropoffCount: 3),
                      StopItineraryItem(
                          stopName: 'Obalende',
                          pickupCount: 2,
                          dropoffCount: 3),
                    ] else
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          SizeMg.padH(23),
                          SizeMg.padV(4),
                          0,
                          SizeMg.padV(12),
                        ),
                        child: InkWell(
                          onTap: _expand,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: ColorsMg.grey3,
                                size: SizeMg.text(24),
                              ),
                              // SizedBox(width: SizeMg.padH(4)),
                              Text(
                                '5 stops',
                                style: StyleMg.alt5medium.copyWith(
                                  color: ColorsMg.primary,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '30 mins',
                                textAlign: TextAlign.end,
                                style: StyleMg.alt5regular.copyWith(
                                  color: ColorsMg.grey5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    EndItineraryItem(
                      stopName: 'Chevron, Lekki II',
                      dropoffCount: 10,
                      parentIsExpanded: _expanded,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

abstract class _ItineraryItem extends StatelessWidget {
  const _ItineraryItem({
    Key? key,
    required this.stopName,
    required this.stopInfo,
    required this.bullet,
    this.parentIsExpanded = true,
  }) : super(key: key);

  final bool parentIsExpanded;
  final String stopName;
  final String stopInfo;
  final Widget bullet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeMg.padV(8.0)),
      child: Row(
        children: [
          SizedBox.square(
            dimension: SizeMg.radius(15),
            child: Center(child: bullet),
          ),
          SizedBox(width: SizeMg.padH(6)),
          Expanded(child: Text(stopName, style: StyleMg.alt4medium)),
          SizedBox(width: SizeMg.padH(6)),
          if (parentIsExpanded) ...[
            Text(stopInfo, style: StyleMg.alt5regular),
            Icon(
              Icons.chevron_right_rounded,
              color: ColorsMg.grey6,
              size: SizeMg.radius(20),
            ),
          ],
        ],
      ),
    );
  }
}

class StartItineraryItem extends _ItineraryItem {
  StartItineraryItem({
    Key? key,
    required String stopName,
    required int pickupCount,
    required bool parentIsExpanded,
  }) : super(
          key: key,
          stopName: stopName,
          stopInfo: '$pickupCount Pickups',
          parentIsExpanded: parentIsExpanded,
          bullet: ImageIcon(
            AssetsMg.busIconRounded,
            color: ColorsMg.greenDark,
            size: SizeMg.radius(16),
          ),
        );
}

class EndItineraryItem extends _ItineraryItem {
  EndItineraryItem({
    Key? key,
    required String stopName,
    required int dropoffCount,
    required bool parentIsExpanded,
  }) : super(
          key: key,
          stopName: stopName,
          stopInfo: '$dropoffCount Drop offs',
          parentIsExpanded: parentIsExpanded,
          bullet: ImageIcon(
            AssetsMg.busIconRounded,
            color: ColorsMg.primary,
            size: SizeMg.radius(16),
          ),
        );
}

class StopItineraryItem extends _ItineraryItem {
  StopItineraryItem({
    Key? key,
    required String stopName,
    required int pickupCount,
    required int dropoffCount,
  }) : super(
          key: key,
          stopName: stopName,
          stopInfo: '$pickupCount Pickups • $dropoffCount Drop offs',
          bullet: Container(
            height: 11,
            decoration: const BoxDecoration(
              color: ColorsMg.backgroundWhite,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  color: ColorsMg.grey4,
                  width: 4,
                ),
              ),
            ),
          ),
        );
}
