import 'package:flutter/material.dart';
import '../../common_widgets/horizontal_sizedbox.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constants.dart';

import '../../common_widgets/base_button.dart';
import '../../common_widgets/base_drop_down_button_form_field.dart';
import '../../common_widgets/base_text_field.dart';
import '../../common_widgets/vertical_sizedbox.dart';

class YourInfoScreen extends StatefulWidget {
  const YourInfoScreen({Key? key}) : super(key: key);

  @override
  State<YourInfoScreen> createState() => _YourInfoScreenState();
}

class _YourInfoScreenState extends State<YourInfoScreen> {
  final gradeController = TextEditingController();
  final experienceController = TextEditingController();
  String? education;
  String? yearOfPassing;
  String? designation;
  String? domain;
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringConstants.yourInfo,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: _formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  StringConstants.educationalInfo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.education,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseDropDownButton(
                  value: education,
                  items: const [
                    'Post Graduate',
                    'Graduate',
                    'HSC/Diploma',
                    'SSC'
                  ],
                  validatorFunction: validateDropDown,
                  onChanged: (value) {
                    setState(() {
                      education = value;
                    });
                  },
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.yearOfPassing,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseDropDownButton(
                  value: yearOfPassing,
                  items: const ['2020', '2021', '2022'],
                  validatorFunction: validateDropDown,
                  onChanged: (value) {
                    setState(() {
                      yearOfPassing = value;
                    });
                  },
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.grade,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: gradeController,
                  validatorFunction: validateGrade,
                  hintText: StringConstants.grade,
                  lable: StringConstants.grade,
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.professionalInfo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.exeperience,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: experienceController,
                  hintText: StringConstants.exeperience,
                  lable: StringConstants.exeperience,
                  validatorFunction: validateExeperience,
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.designation,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseDropDownButton(
                  value: designation,
                  items: const ['Designation', 'Designation1', 'Designation2'],
                  validatorFunction: validateDropDown,
                  onChanged: (value) {
                    setState(() {
                      designation = value;
                    });
                  },
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.domain,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseDropDownButton(
                  value: domain,
                  items: const ['Domain', 'Domain1', 'Domain2'],
                  onChanged: (value) {
                    setState(() {
                      domain = value;
                    });
                  },
                ),
                const VerticalSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: BaseButton(
                        buttonText: StringConstants.previous,
                        width: 100,
                        onPressed: () {},
                      ),
                    ),
                    const HorizontalSizedBox(),
                    Expanded(
                      child: BaseButton(
                        width: 100,
                        buttonText: StringConstants.next,
                        onPressed: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            Navigator.pushNamed(
                                context, RouteConstants.yourAddress);
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  String? validateDropDown(String? value) {
    if (value == null) {
      return StringConstants.requiredField;
    } else {
      return null;
    }
  }

  String? validateGrade(String? value) {
    if (value!.isEmpty) {
      return StringConstants.requiredField;
    } else if (!RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
      return StringConstants.pleaseEnterValidGrade;
    } else {
      return null;
    }
  }

  String? validateExeperience(String? value) {
    if (value!.isEmpty) {
      return StringConstants.requiredField;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return StringConstants.pleaseEnterValidExeperience;
    } else {
      return null;
    }
  }
}
