import 'package:flutter/material.dart';
import 'constants/string_constants.dart';

import 'modules/registration/registration_screen.dart';

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
      home: const RegistrationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
