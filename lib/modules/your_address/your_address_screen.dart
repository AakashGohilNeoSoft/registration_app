import 'package:flutter/material.dart';

import '../../common_widgets/base_button.dart';
import '../../common_widgets/base_drop_down_button_form_field.dart';
import '../../common_widgets/base_text_field.dart';
import '../../common_widgets/vertical_sizedbox.dart';
import '../../constants/padding_constants.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyles_constants.dart';
import '../../models/address_info_model.dart';
import '../../utils/app_singelton.dart';

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
  String? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringConstants.yourAddress,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: PaddingConstants.commonPagePadding,
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
                const Text(StringConstants.state,
                    style: TextStyleConstants.heading),
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
                    try {
                      if (_formGlobalKey.currentState!.validate()) {
                        Singleton.addressInfo = AddressInfo(
                            address: addressController.text,
                            landmark: landmarkController.text,
                            city: cityController.text,
                            state: state!,
                            pincode: int.parse(pincodeController.text));
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteConstants.registrationSuccessful,
                            (route) => false);
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
