import 'package:flutter/material.dart';

import '../../../../application/app_routing/app_navigator.dart';
import '../../../../application/app_view/app_view.dart';

class ViewManifestButton extends StatelessWidget {
  const ViewManifestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: ColorsMg.grey10)),
      ),
      child: TextButton(
        onPressed: () => AppNavigator.pushNamed(
          tripManifestViewRoute,
          arguments: null,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16),
          primary: ColorsMg.backgroundWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetsMg.documentIcon,
              color: ColorsMg.grey5,
              size: SizeMg.radius(20),
            ),
            SizedBox(
              width: SizeMg.padH(8),
            ),
            Text(
              'View trip Manifest',
              style: StyleMg.alt4medium.copyWith(
                color: ColorsMg.primary,
                height: 1.5, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
