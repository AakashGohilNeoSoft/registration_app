import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_widgets/base_button.dart';
import '../../common_widgets/base_drop_down_button_form_field.dart';
import '../../common_widgets/base_text_field.dart';
import '../../common_widgets/horizontal_sizedbox.dart';
import '../../common_widgets/vertical_sizedbox.dart';
import '../../constants/padding_constants.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyles_constants.dart';
import '../../models/education_info_model.dart';
import '../../models/professional_info_model.dart';
import '../../utils/app_singelton.dart';
import '../../utils/common_methods.dart';
import 'bloc/your_info_bloc.dart';

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
          padding: PaddingConstants.commonPagePadding,
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
                  style: TextStyleConstants.heading,
                ),
                const VerticalSizedBox(),
                BlocBuilder<YourInfoBloc, YourInfoState>(
                  builder: (context, state) {
                    if (state is EducationSelectedState) {
                      education = state.value;
                    }
                    return BaseDropDownButton(
                      value: education,
                      items: const [
                        'Post Graduate',
                        'Graduate',
                        'HSC/Diploma',
                        'SSC'
                      ],
                      validatorFunction: CommonMethods.validateDropDown,
                      onChanged: (value) {
                        BlocProvider.of<YourInfoBloc>(context)
                            .add(SelectEducationEvent(value));
                      },
                    );
                  },
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.yearOfPassing,
                  style: TextStyleConstants.heading,
                ),
                const VerticalSizedBox(),
                BlocBuilder<YourInfoBloc, YourInfoState>(
                  builder: (context, state) {
                    if (state is YearOfPassingSelectedState) {
                      yearOfPassing = state.value;
                    }
                    return BaseDropDownButton(
                      value: yearOfPassing,
                      items: const ['2020', '2021', '2022'],
                      validatorFunction: CommonMethods.validateDropDown,
                      onChanged: (value) {
                        BlocProvider.of<YourInfoBloc>(context)
                            .add(SelectYearOfPassingEvent(value));
                      },
                    );
                  },
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.grade,
                  style: TextStyleConstants.heading,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: gradeController,
                  validatorFunction: validateGrade,
                  hintText: StringConstants.grade,
                  lable: StringConstants.grade,
                ),
                const VerticalSizedBox(),
                Text(
                  StringConstants.professionalInfo,
                  style: TextStyleConstants.heading.copyWith(fontSize: 20),
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.exeperience,
                  style: TextStyleConstants.heading,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: experienceController,
                  hintText: StringConstants.exeperience,
                  lable: StringConstants.exeperience,
                  keyboardType: TextInputType.number,
                  validatorFunction: validateExeperience,
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.designation,
                  style: TextStyleConstants.heading,
                ),
                const VerticalSizedBox(),
                BlocBuilder<YourInfoBloc, YourInfoState>(
                  builder: (context, state) {
                    if (state is DesignationSelectedState) {
                      designation = state.value;
                    }
                    return BaseDropDownButton(
                      value: designation,
                      items: const [
                        'Designation',
                        'Designation1',
                        'Designation2'
                      ],
                      validatorFunction: CommonMethods.validateDropDown,
                      onChanged: (value) {
                        BlocProvider.of<YourInfoBloc>(context)
                            .add(SelectDesignationEvent(value));
                      },
                    );
                  },
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.domain,
                  style: TextStyleConstants.heading,
                ),
                const VerticalSizedBox(),
                BlocBuilder<YourInfoBloc, YourInfoState>(
                  builder: (context, state) {
                    if (state is DomainSelectedState) {
                      domain = state.value;
                    }
                    return BaseDropDownButton(
                      value: domain,
                      items: const ['Domain', 'Domain1', 'Domain2'],
                      onChanged: (value) {
                        BlocProvider.of<YourInfoBloc>(context)
                            .add(SelectDomainEvent(value));
                      },
                    );
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
                      child: BlocBuilder<YourInfoBloc, YourInfoState>(
                        builder: (context, state) {
                          return BaseButton(
                            width: 100,
                            buttonText: StringConstants.next,
                            onPressed: () {
                              BlocProvider.of<YourInfoBloc>(context).add(
                                  SubmitYourInfoEvent(
                                      _formGlobalKey.currentState!));

                              if (state is YourInfoValidatedState) {
                                try {
                                  Singleton.educationInfo = EducationInfo(
                                      education: education!,
                                      yearOfPassing: int.parse(yearOfPassing!),
                                      grade: gradeController.text);

                                  Singleton.professionalInfo = ProfessionalInfo(
                                      exeperience:
                                          int.parse(experienceController.text),
                                      designation: designation!,
                                      domain: domain);
                                  Navigator.pushNamed(
                                      context, RouteConstants.yourAddress);
                                } catch (e) {
                                  throw (e.toString());
                                }
                              }
                            },
                          );
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
