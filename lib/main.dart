import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/registration/bloc/registration_bloc.dart';
import 'modules/registration/registration_screen.dart';

import 'constants/string_constants.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.registrationApp,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      home: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: const RegistrationScreen(),
      ),
    );
  }
}
