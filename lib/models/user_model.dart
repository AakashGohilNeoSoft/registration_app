import 'professional_info_model.dart';

import 'address_info_model.dart';
import 'basic_info_model.dart';
import 'education_info_model.dart';

class User {
  final BasicInfo basicInfo;
  final EducationInfo educationInfo;
  final ProfessionalInfo professionalInfo;
  final AddressInfo addressInfo;

  User(
      {required this.basicInfo,
      required this.educationInfo,
      required this.professionalInfo,
      required this.addressInfo});
}
