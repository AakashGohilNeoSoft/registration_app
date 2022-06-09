import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/your_address/bloc/your_address_bloc.dart';
import '../modules/registration/bloc/registration_bloc.dart';

import '../constants/routes_constants.dart';
import '../modules/registration/registration_screen.dart';
import '../modules/registration_successful/registration_successful_screen.dart';
import '../modules/your_address/your_address_screen.dart';
import '../modules/your_info/bloc/your_info_bloc.dart';
import '../modules/your_info/your_info_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.registration:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegistrationBloc(),
            child: const RegistrationScreen(),
          ),
        );
      case RouteConstants.yourInfo:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => YourInfoBloc(),
              child: const YourInfoScreen(),
            );
          },
        );
      case RouteConstants.yourAddress:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => YourAddressBloc(),
            child: const YourAddressScreen(),
          ),
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
