import 'package:flutter/material.dart';
import 'package:registration_app/common_widgets/base_button.dart';
import 'package:registration_app/common_widgets/base_text_field.dart';
import 'package:registration_app/common_widgets/horizontal_sizedbox.dart';
import 'package:registration_app/constants/string_constants.dart';

import '../../common_widgets/vertical_sizedbox.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  int _groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  StringConstants.registration,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const VerticalSizedBox(),
                Stack(
                  children: const [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 43,
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 12,
                      ),
                    ),
                  ],
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  hintText: StringConstants.firstName,
                  textEditingController: firstNameController,
                  prefixIcon: Icons.person,
                  lable: StringConstants.firstName,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  hintText: StringConstants.lastName,
                  textEditingController: lastNameController,
                  prefixIcon: Icons.person,
                  lable: StringConstants.lastName,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  hintText: StringConstants.phone,
                  textEditingController: phoneController,
                  prefixIcon: Icons.phone,
                  lable: StringConstants.phone,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  hintText: StringConstants.email,
                  textEditingController: emailController,
                  prefixIcon: Icons.email_outlined,
                  lable: StringConstants.email,
                ),
                const VerticalSizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        StringConstants.gender,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const VerticalSizedBox(),
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _groupValue,
                            onChanged: (value) {
                              setState(() {
                                _groupValue = value as int;
                              });
                            }),
                        const Text(StringConstants.male),
                        const HorizontalSizedBox(),
                        Radio(
                            value: 2,
                            groupValue: _groupValue,
                            onChanged: (value) {
                              setState(() {
                                _groupValue = value as int;
                              });
                            }),
                        const Text(StringConstants.female)
                      ],
                    ),
                  ],
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  hintText: StringConstants.password,
                  textEditingController: passwordController,
                  prefixIcon: Icons.lock,
                  lable: StringConstants.password,
                  suffixIcon: Icons.remove_red_eye,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  hintText: StringConstants.confirmPassword,
                  textEditingController: confirmPasswordController,
                  prefixIcon: Icons.lock,
                  lable: StringConstants.confirmPassword,
                ),
                const VerticalSizedBox(),
                const BaseButton(
                  buttonText: StringConstants.next,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
