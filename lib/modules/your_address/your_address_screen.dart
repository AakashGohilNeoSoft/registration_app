import 'package:flutter/material.dart';
import '../../constants/routes_constants.dart';
import '../../common_widgets/base_button.dart';
import '../../common_widgets/base_drop_down_button_form_field.dart';
import '../../common_widgets/base_text_field.dart';
import '../../common_widgets/vertical_sizedbox.dart';
import '../../constants/string_constants.dart';

class YourAddressScreen extends StatefulWidget {
  const YourAddressScreen({Key? key}) : super(key: key);

  @override
  State<YourAddressScreen> createState() => _YourAddressScreenState();
}

class _YourAddressScreenState extends State<YourAddressScreen> {
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? state;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringConstants.yourAddress,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseTextField(
                  textEditingController: addressController,
                  hintText: StringConstants.address,
                  lable: StringConstants.address,
                  prefixIcon: Icons.location_city,
                  validatorFunction: validateMoreThan3Characters,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: landmarkController,
                  hintText: StringConstants.landmark,
                  lable: StringConstants.landmark,
                  validatorFunction: validateMoreThan3Characters,
                  prefixIcon: Icons.location_city,
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: cityController,
                  hintText: StringConstants.city,
                  lable: StringConstants.city,
                  validatorFunction: validateCity,
                  prefixIcon: Icons.location_city,
                ),
                const VerticalSizedBox(),
                const Text(
                  StringConstants.state,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const VerticalSizedBox(),
                BaseDropDownButton(
                  value: state,
                  items: const ['Gujarat', 'Goa', 'UP'],
                  validatorFunction: validateDropDown,
                  onChanged: (value) {
                    setState(() {
                      state = value;
                    });
                  },
                ),
                const VerticalSizedBox(),
                BaseTextField(
                  textEditingController: pincodeController,
                  hintText: StringConstants.pincode,
                  lable: StringConstants.pincode,
                  validatorFunction: validatePincode,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  prefixIcon: Icons.location_city,
                ),
                const VerticalSizedBox(),
                BaseButton(
                  width: double.infinity,
                  buttonText: StringConstants.submit,
                  onPressed: () {
                    if (_formGlobalKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteConstants.registrationSuccessful,
                          (route) => false);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  String? validateMoreThan3Characters(String? value) {
    if (value!.isEmpty || value.length < 3) {
      return StringConstants.minimum3CharactersAreRequired;
    } else {
      return null;
    }
  }

  String? validateCity(String? value) {
    if (value!.isEmpty) {
      return StringConstants.requiredField;
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return StringConstants.pleaseEnterValidCity;
    } else {
      return null;
    }
  }

  String? validateDropDown(String? value) {
    if (value == null) {
      return StringConstants.requiredField;
    } else {
      return null;
    }
  }

  String? validatePincode(String? value) {
    if (value!.isEmpty || value.length != 6) {
      return StringConstants.thePincodeMustBeOf6Digits;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return StringConstants.enterValidPincode;
    } else {
      return null;
    }
  }
}
