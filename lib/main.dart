import 'package:flutter/material.dart';
import 'package:registration_app/constants/routes_constants.dart';
import 'package:registration_app/utils/routes.dart';
import 'constants/string_constants.dart';

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
      initialRoute: RouteConstants.registration,
    );
  }
}
