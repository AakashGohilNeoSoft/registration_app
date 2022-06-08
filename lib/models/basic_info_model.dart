class BasicInfo {
  final String firstName;
  final String lastName;
  final int phone;
  final String email;
  final Gender gender;
  final String password;

  BasicInfo({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.gender,
    required this.password,
  });
}

class Gender {
  final int gender; //1=male,2=female

  Gender(this.gender);
}
