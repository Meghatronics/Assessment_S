import 'package:flutter/material.dart';

import '../../application/app_view/app_view.dart';
import 'dashboard_router.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    required Key key,
    required this.profileImage,
  }) : super(key: key);

  final ImageProvider profileImage;
  @override
  CustomNavBarState createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  int _index = 0;
  static const _dashIcons = <ImageProvider>[
    AssetsMg.homeIcon,
    AssetsMg.routeIcon,
  ];
  void navigateToIndex(int index) {
    switch (index) {
      case 0:
        DashboardRouter.instance.replaceWithNamed(dashboardHomeRoute);
        break;
      case 1:
        DashboardRouter.instance.replaceWithNamed(dashboardRoutesRoute);
        break;
      case 2:
        DashboardRouter.instance.replaceWithNamed(dashboardProfileRoute);
        break;
    }
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeMg.height(80),
      decoration: const BoxDecoration(
        color: ColorsMg.backgroundWhite,
      ),
      padding: EdgeInsets.fromLTRB(
        SizeMg.padH(8),
        SizeMg.padH(16),
        SizeMg.padH(8),
        SizeMg.padH(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < 2; i++)
            Expanded(
              child: InkResponse(
                onTap: () => navigateToIndex(i),
                child: ImageIcon(
                  _dashIcons[i],
                  color: _index == i ? ColorsMg.primary : ColorsMg.grey7,
                  size: SizeMg.width(24),
                ),
              ),
            ),
          Expanded(
            child: InkResponse(
              onTap: () => navigateToIndex(2),
              child: CircleAvatar(
                backgroundImage: widget.profileImage,
                radius: SizeMg.radius(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
