import 'dart:io' show Platform;
import 'package:accion/views/auth/open_account/get_started.dart';
import 'package:accion/views/auth/register/create_trans_pin.dart';
import 'package:accion/views/auth/register/register.dart';
import 'package:accion/views/auth/register/register_details.dart';
import 'package:accion/views/auth/shared/verification.dart';
import 'package:accion/views/onboarding/welcome_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomeView:
      return _getPageRoute(
          routeName: welcomeView,
          view: const WelcomeView(),
          args: settings.arguments);
    case registerUserView:
      return _getPageRoute(
          routeName: welcomeView,
          view: const RegisterUserView(),
          args: settings.arguments);
    case verificationView:
      return _getPageRoute(
          routeName: welcomeView,
          view: const VerificationView(),
          args: settings.arguments);
    case registerdetailsView:
      return _getPageRoute(
          routeName: welcomeView,
          view: const RegisterDetailsView(),
          args: settings.arguments);
    case createtranspinView:
      return _getPageRoute(
          routeName: welcomeView,
          view: const CreateTransPinView(),
          args: settings.arguments);
    case openaccctStartedView:
      return _getPageRoute(
          routeName: welcomeView,
          view: const OpenAcctStartedView(),
          args: settings.arguments);
    default:
      return CupertinoPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute(
    {required String routeName, required Widget view, Object? args}) {
  return Platform.isIOS
      ? CupertinoPageRoute<dynamic>(
          settings: RouteSettings(name: routeName, arguments: args),
          builder: (_) => view)
      : MaterialPageRoute<dynamic>(
          settings: RouteSettings(name: routeName, arguments: args),
          builder: (_) => view);
}
