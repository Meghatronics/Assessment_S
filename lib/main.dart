import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application/app_routing/app_navigator.dart';
import 'application/app_routing/app_router.dart';
import 'application/app_view/app_view.dart';
import 'utilities/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    AppDependencies.i.register(),
    AssetsMg.initMapMarkers(),
  ]);
  runApp(const ThisApp());
}

class ThisApp extends StatelessWidget {
  const ThisApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      builder: () => MaterialApp(
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        //? ROUTING PARAMS
        navigatorKey: AppNavigator.key,
        onGenerateRoute: AppRouter.i.generateRoute,
        initialRoute: dashboardRoute,
        //? THEMING
        theme: ThemeData(
          primaryColor: ColorsMg.primary,
          scaffoldBackgroundColor: ColorsMg.backgroundWhite,
          //   splashColor: altYellow.withOpacity(0.5),
          //   textSelectionTheme: TextSelectionThemeData(
          //     cursorColor: themePrimaryPurple,
          //     selectionColor: themePrimaryPink.withOpacity(0.3),
          //     selectionHandleColor: altYellow,
          //   ),
          //   backgroundColor: const Color(0xFFE6EBF1),
          textTheme: GoogleFonts.heeboTextTheme(),
          dividerTheme: DividerThemeData(
            color: ColorsMg.grey10,
            thickness: SizeMg.radius(1),
          ),
          // popupMenuTheme: const PopupMenuThemeData(
          //   elevation: 4,
          //   textStyle: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w700,
          //     color: textBlack,
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(16)),
          //   ),
          // ),
        ),
      ),
    );
  }
}
