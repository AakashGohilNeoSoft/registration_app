import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widgets/base_button.dart';
import '../../common_widgets/base_text_field.dart';
import '../../common_widgets/horizontal_sizedbox.dart';
import '../../common_widgets/vertical_sizedbox.dart';
import '../../constants/asset_paths.dart';
import '../../constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyles_constants.dart';
import '../../models/basic_info_model.dart';
import '../../utils/app_singelton.dart';
import 'bloc/registration_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //TextField Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  int _groupValue = 1; //radio button value
  final _formGlobalKey = GlobalKey<FormState>();
  File? profilePhoto;
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
          padding: PaddingConstants.commonPagePadding,
          child: SingleChildScrollView(
            child: Form(
              key: _formGlobalKey,
              child: Column(
                children: [
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () async {
                          BlocProvider.of<RegistrationBloc>(context)
                              .add(PickImageEvent(imagePicker: _imagePicker));
                          if (state is ImagePickedState) {
                            profilePhoto = state.image;
                          }
                        },
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: ColorConstants.blackColor,
                              child: CircleAvatar(
                                  radius: 43,
                                  backgroundImage: ((profilePhoto) != null)
                                      ? FileImage(profilePhoto!)
                                      : null,
                                  child: (profilePhoto == null)
                                      ? ClipOval(
                                          child: Image.asset(
                                            AssetPaths.noUserPhoto,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : null),
                            ),
                            const CircleAvatar(
                              radius: 14,
                              backgroundColor: ColorConstants.blackColor,
                              child: CircleAvatar(
                                radius: 12,
                                child: Icon(
                                  Icons.edit,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                        padding: PaddingConstants.left16,
                        child: Text(
                          StringConstants.gender,
                          style: TextStyleConstants.heading,
                        ),
                      ),
                      const VerticalSizedBox(),
                      BlocBuilder<RegistrationBloc, RegistrationState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: (state is SelectedGender)
                                      ? state.gender
                                      : 1,
                                  onChanged: (value) {
                                    BlocProvider.of<RegistrationBloc>(context)
                                        .add(MaleSelectedEvent());
                                    _groupValue = value as int;
                                  }),
                              const Text(StringConstants.male),
                              const HorizontalSizedBox(),
                              Radio(
                                  value: 2,
                                  groupValue: (state is SelectedGender)
                                      ? state.gender
                                      : 1,
                                  onChanged: (value) {
                                    BlocProvider.of<RegistrationBloc>(context)
                                        .add(FemaleSelectedEvent());
                                    _groupValue = value as int;
                                  }),
                              const Text(StringConstants.female)
                            ],
                          );
                        },
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
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return BaseButton(
                        width: double.infinity,
                        buttonText: StringConstants.next,
                        onPressed: () {
                          BlocProvider.of<RegistrationBloc>(context).add(
                              NextButtonPressedEvent(
                                  _formGlobalKey.currentState!));
                          if (state is FormValidatedState) {
                            Singleton.basicInfo = BasicInfo(
                                profilePhoto: profilePhoto,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                phone: int.parse(phoneController.text),
                                email: emailController.text,
                                password: passwordController.text,
                                gender: Gender(_groupValue));
                            Navigator.pushNamed(
                                context, RouteConstants.yourInfo);
                          }
                        },
                      );
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
}
