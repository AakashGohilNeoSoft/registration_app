import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registration_app/models/basic_info_model.dart';
import 'package:registration_app/utils/app_singelton.dart';
import '../../constants/routes_constants.dart';
import '../../common_widgets/base_button.dart';
import '../../common_widgets/base_text_field.dart';
import '../../common_widgets/horizontal_sizedbox.dart';
import '../../constants/string_constants.dart';

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
  final _formGlobalKey = GlobalKey<FormState>();
  XFile? profilePhoto;
  Image? dp;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringConstants.registration,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formGlobalKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      pickImage();
                    },
                    child: Stack(
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
                  ),
                  const VerticalSizedBox(),
                  BaseTextField(
                    hintText: StringConstants.firstName,
                    textEditingController: firstNameController,
                    prefixIcon: Icons.person,
                    lable: StringConstants.firstName,
                    validatorFunction: validateFirstName,
                  ),
                  const VerticalSizedBox(),
                  BaseTextField(
                    hintText: StringConstants.lastName,
                    textEditingController: lastNameController,
                    prefixIcon: Icons.person,
                    lable: StringConstants.lastName,
                    validatorFunction: validateLastName,
                  ),
                  const VerticalSizedBox(),
                  BaseTextField(
                    hintText: StringConstants.phone,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    textEditingController: phoneController,
                    prefixIcon: Icons.phone,
                    lable: StringConstants.phone,
                    validatorFunction: validatePhone,
                  ),
                  const VerticalSizedBox(),
                  BaseTextField(
                    hintText: StringConstants.email,
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    prefixIcon: Icons.email_outlined,
                    lable: StringConstants.email,
                    validatorFunction: validateEmail,
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
                    wantObscureText: true,
                    validatorFunction: validatePassword,
                  ),
                  const VerticalSizedBox(),
                  BaseTextField(
                    hintText: StringConstants.confirmPassword,
                    textEditingController: confirmPasswordController,
                    prefixIcon: Icons.lock,
                    lable: StringConstants.confirmPassword,
                    wantObscureText: true,
                    validatorFunction: validateConfirmPassword,
                  ),
                  const VerticalSizedBox(),
                  BaseButton(
                    width: double.infinity,
                    buttonText: StringConstants.next,
                    onPressed: () {
                      try {
                        if (_formGlobalKey.currentState!.validate()) {
                          Singleton.basicInfo = BasicInfo(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phone: int.parse(phoneController.text),
                              email: emailController.text,
                              password: passwordController.text,
                              gender: Gender(_groupValue));
                          Navigator.pushNamed(context, RouteConstants.yourInfo);
                        }
                      } catch (e) {
                        throw (e.toString());
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateConfirmPassword(value) {
    if (value!.isEmpty) {
      return StringConstants.pleaseEnterPassword;
    } else if (value != passwordController.text) {
      return StringConstants.passwordDoesNotMatch;
    } else {
      return null;
    }
  }

  String? validatePassword(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return StringConstants.pleaseEnterPassword;
    } else if (!regex.hasMatch(value)) {
      return StringConstants.pleaseEnterValidPassword;
    } else {
      return null;
    }
  }

  String? validateEmail(value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return StringConstants.pleaseEnterValidEmailAddress;
    } else {
      return null;
    }
  }

  String? validatePhone(value) {
    if (value!.isEmpty || value.length != 10) {
      return StringConstants.mobileNumberMustBeOf10Digits;
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return StringConstants.pleaseEnterValidMobileNumber;
    } else {
      return null;
    }
  }

  String? validateLastName(value) {
    if (value!.isEmpty || value.length < 3) {
      return StringConstants.minimum3CharactersAreRequired;
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return StringConstants.pleaseEnterValidLastName;
    } else {
      return null;
    }
  }

  String? validateFirstName(value) {
    if (value!.isEmpty || value.length < 3) {
      return StringConstants.minimum3CharactersAreRequired;
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return StringConstants.pleaseEnterValidFirstName;
    } else {
      return null;
    }
  }

  void pickImage() async {
    try {
      profilePhoto = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (profilePhoto != null) {
        setState(() {});
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
