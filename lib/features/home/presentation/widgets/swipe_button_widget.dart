import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../../../application/app_view/app_view.dart';

class SwipeButtonWidget extends SwipeableTile {
  SwipeButtonWidget({
    Key? key,
    required this.onSwipe,
    required this.label,
    Widget? underSwipeWidget,
    TextDirection swipeDirection = TextDirection.ltr,
    Color color = ColorsMg.primary,
    this.labelColor = ColorsMg.black1,
  }) : super(
          onSwiped: (_) => onSwipe(),
          key: key ?? const Key('swipe_button'),
          color: color,
          isEelevated: false,
          backgroundBuilder: (_, direction, progress) =>
              underSwipeWidget ?? Container(color: ColorsMg.black1),
          borderRadius: 0,
          direction: swipeDirection == TextDirection.ltr
              ? SwipeDirection.startToEnd
              : SwipeDirection.endToStart,
          child: Container(
            height: SizeMg.height(50),
            alignment: Alignment.center,
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: StyleMg.bold14.copyWith(
                    color: labelColor,
                  ),
                ),
                SizedBox(width: 16),
                const ChevronAnimation(),
              ],
            ),
          ),
        );

  final VoidCallback onSwipe;
  final String label;
  final Color labelColor;
}

class ChevronAnimation extends StatefulWidget {
  const ChevronAnimation({Key? key}) : super(key: key);

  @override
  State<ChevronAnimation> createState() => _ChevronAnimationState();
}

class _ChevronAnimationState extends State<ChevronAnimation>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    _controllers = List.generate(
      6,
      (index) => AnimationController(
          value: _opacityTrail[index],
          animationBehavior: AnimationBehavior.preserve,
          vsync: this,
          lowerBound: 0,
          upperBound: 1,
          duration: const Duration(milliseconds: 1500))
        ..repeat().orCancel
        ..addListener(() {
          setState(() {});
        }),
    );

    _animations = _controllers
        .map((e) => Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
              curve: Curves.easeInSine,
              parent: e,
            )))
        .toList();

    super.initState();
  }

  static const _opacityTrail = [0.2, 0.35, 0.5, 0.65, 0.8, 0.95];
  @override
  void dispose() {
    for (var element in _controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          AnimatedOpacity(
            opacity: _animations[5 - i].value,
            duration: const Duration(microseconds: 500),
            // curve: Curves.fastOutSlowIn,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Image(
                image: AssetsMg.caretRightIcon,
                // width: 16,
                height: 12,
              ),
              // Icon(
              //   Icons.chevron_right_rounded,
              //   color: Color(0xFFEDFDF5),
              //   size: 32,
              // ),
            ),
          )
      ],
    );
  }
}
