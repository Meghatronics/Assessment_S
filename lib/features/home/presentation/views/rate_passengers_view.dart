import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../application/app_routing/app_navigator.dart';
import '../../../../application/app_view/app_view.dart';

class RatePassengersView extends StatelessWidget {
  const RatePassengersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              SizeMg.padH(20),
              SizeMg.padV(88),
              SizeMg.padH(20),
              SizeMg.padV(24),
            ),
            child: Column(
              children: [
                Text(
                  'Thank You!',
                  style: StyleMg.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeMg.padV(27)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // alignment: Alignment.topCenter,
                  children: [
                    Transform.translate(
                      offset: Offset(SizeMg.radius(44), 0),
                      // right: SizeMg.width(142),
                      child: Image(
                        image: AssetsMg.shuttlerBus,
                        height: SizeMg.radius(56),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-SizeMg.radius(44), 0),
                      child: CircleAvatar(
                        backgroundImage: AssetsMg.dummyImage,
                        radius: SizeMg.radius(28),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeMg.padV(32)),
                Text(
                  'Please rate the passengers',
                  style: StyleMg.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeMg.padV(12)),
                RatingBar(
                  glow: false,
                  itemSize: SizeMg.radius(40) + 8,
                  ratingWidget: RatingWidget(
                    empty: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: ImageIcon(
                        AssetsMg.starIcon,
                        color: ColorsMg.grey9,
                        // size: SizeMg.radius(40),
                      ),
                    ),
                    half: const ImageIcon(
                      AssetsMg.starIcon,
                      color: ColorsMg.primary,
                      // size: SizeMg.radius(40),
                    ),
                    full: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: ImageIcon(
                        AssetsMg.starIcon,
                        color: ColorsMg.primary,
                        // size: SizeMg.radius(40),
                      ),
                    ),
                  ),
                  onRatingUpdate: (rating) {
                    //TODO: Couple update rating with VM
                  },
                ),
              ],
            ),
          ),
          const _TripDataWidget(
            points: '+25',
            distance: '400 KM',
          ),
          const Divider(height: 0.5),
          TextButton(
            onPressed: () {
              //TODO: Implement View Trip Details
            },
            style: TextButton.styleFrom(
                backgroundColor: ColorsMg.grey11,
                padding: EdgeInsets.all(SizeMg.padV(11)),
                minimumSize: Size.fromHeight(SizeMg.height(48))),
            child: Text(
              'View Trip Details',
              style: StyleMg.alt5medium.copyWith(
                color: ColorsMg.primaryDark,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              SizeMg.padH(20),
              SizeMg.padV(24),
              SizeMg.padH(20),
              SizeMg.padV(40),
            ),
            child: Column(
              children: [
                Text(
                  'Would you like to report an incident? '
                  'Don’t worry this report will be treated anonymously.',
                  textAlign: TextAlign.center,
                  style: StyleMg.subtext.copyWith(
                    color: ColorsMg.grey4,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //TODO: Implement Report Passenger
                  },
                  child: Text(
                    'Report Passenger',
                    textAlign: TextAlign.center,
                    style: StyleMg.subtext.copyWith(
                      color: ColorsMg.primary,
                    ),
                  ),
                ),
                SizedBox(height: SizeMg.height(96)),
                const AppButton(
                  onPressed: AppNavigator.pop,
                  label: 'Done',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TripDataWidget extends StatelessWidget {
  const _TripDataWidget({
    Key? key,
    required this.points,
    required this.distance,
  }) : super(key: key);

  final String points;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorsMg.grey11,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeMg.padH(20),
          vertical: SizeMg.padV(19),
        ),
        child: Column(
          children: [
            dataRowWidget('Points Earned', points),
            SizedBox(height: SizeMg.padV(20)),
            dataRowWidget('Total Distance', distance),
          ],
        ));
  }

  Row dataRowWidget(String label, String data) {
    return Row(
      children: [
        Text(
          label,
          style: StyleMg.alt5medium.copyWith(color: ColorsMg.black1),
        ),
        Expanded(
          child: Text(
            data,
            textAlign: TextAlign.end,
            style: StyleMg.alt5regular.copyWith(color: ColorsMg.grey4),
          ),
        ),
      ],
    );
  }
}
