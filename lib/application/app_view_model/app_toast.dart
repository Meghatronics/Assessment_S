import 'package:flutter/material.dart';

import '../app_routing/app_navigator.dart';
import '../app_view/app_view.dart';

abstract class AppToast {
  static void error(String heading, String body) {
    final overlay = AppNavigator.key.currentState!.overlay!;
    OverlayEntry? _error;
    _error = OverlayEntry(
      builder: (_) => Positioned(
        bottom: SizeMg.height(80),
        right: SizeMg.width(20),
        left: SizeMg.width(20),
        child: _ErrorOverlayWidget(
          ref: _error!,
          heading: heading,
          body: body,
        ),
      ),
    );
    overlay.insert(_error);
  }
}

class _ErrorOverlayWidget extends StatelessWidget {
  const _ErrorOverlayWidget({
    Key? key,
    required this.ref,
    this.heading,
    this.body,
  }) : super(key: key);

  final OverlayEntry ref;
  final String? heading;
  final String? body;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
            // color: ColorsMg.redDefault,
            borderRadius: BorderRadius.circular(SizeMg.radius(16)),
            image: const DecorationImage(
              image: AssetsMg.errorBubbles,
              fit: BoxFit.contain,
              alignment: Alignment.topLeft,
            )),
        child: Container(
          margin: EdgeInsets.only(top: SizeMg.height(14)),
          // height: SizeMg.height(96),
          decoration: BoxDecoration(
            color: ColorsMg.redDefault,
            borderRadius: BorderRadius.circular(SizeMg.radius(16)),
          ),
          padding: const EdgeInsets.only(left: 72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(-8, 8),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkResponse(
                    onTap: ref.remove,
                    child: const Icon(
                      Icons.close,
                      color: ColorsMg.backgroundWhite,
                      size: 16,
                    ),
                  ),
                ),
              ),
              if (heading != null)
                Text(
                  heading!,
                  style: StyleMg.alt2bold.copyWith(
                    color: ColorsMg.backgroundWhite,
                  ),
                ),
              const SizedBox(height: 4),
              if (body != null)
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(
                    body!,
                    style: StyleMg.alt5regular.copyWith(
                      color: ColorsMg.backgroundWhite,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
