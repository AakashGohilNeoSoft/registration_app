import 'package:registration_app/models/address_info_model.dart';
import 'package:registration_app/models/basic_info_model.dart';
import 'package:registration_app/models/education_info_model.dart';
import 'package:registration_app/models/professional_info_model.dart';
import 'package:registration_app/models/user_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static BasicInfo? basicInfo;
  static EducationInfo? educationInfo;
  static ProfessionalInfo? professionalInfo;
  static AddressInfo? addressInfo;
  static User? user;
}
