import 'package:flutter/material.dart';
import '../../constants/padding_constants.dart';

class RegistrationSuccessfulScreen extends StatelessWidget {
  const RegistrationSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: PaddingConstants.commonPagePadding,
        child: Center(
          child: Text('Registration Successful'),
        ),
      )),
    );
  }
}
