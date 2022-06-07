import 'package:flutter/material.dart';
import 'package:registration_app/constants/routes_constants.dart';
import 'package:registration_app/modules/registration/registration_screen.dart';
import 'package:registration_app/modules/your_info/your_info_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.registration:
        return MaterialPageRoute(
          builder: (context) => const RegistrationScreen(),
        );
      case RouteConstants.yourInfo:
        return MaterialPageRoute(
          builder: (context) => const YourInfoScreen(),
        );

      default:
        return null;
    }
  }
}
