import '../constants/string_constants.dart';

class CommonMethods{
   static  String? validateDropDown(String? value) {
    if (value == null) {
      return StringConstants.requiredField;
    } else {
      return null;
    }
  }
}