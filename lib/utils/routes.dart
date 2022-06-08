import 'package:flutter/material.dart';
import '../constants/routes_constants.dart';
import '../modules/registration/registration_screen.dart';
import '../modules/registration_successful/registration_successful_screen.dart';
import '../modules/your_address/your_address_screen.dart';
import '../modules/your_info/your_info_screen.dart';

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
      case RouteConstants.yourAddress:
        return MaterialPageRoute(
          builder: (context) => const YourAddressScreen(),
        );
      case RouteConstants.registrationSuccessful:
        return MaterialPageRoute(
          builder: (context) => const RegistrationSuccessfulScreen(),
        );

      default:
        return null;
    }
  }
}
