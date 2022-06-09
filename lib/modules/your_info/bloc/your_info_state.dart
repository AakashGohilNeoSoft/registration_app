part of 'your_info_bloc.dart';

@immutable
abstract class YourInfoState {}

class YourInfoInitial extends YourInfoState {}

class EducationSelectedState extends YourInfoState {
  final dynamic value;

  EducationSelectedState(this.value);
}

class YearOfPassingSelectedState extends YourInfoState {
  final dynamic value;

  YearOfPassingSelectedState(this.value);
}

class DesignationSelectedState extends YourInfoState {
  final dynamic value;

  DesignationSelectedState(this.value);
}

class DomainSelectedState extends YourInfoState {
  final dynamic value;

  DomainSelectedState(this.value);
}

class YourInfoValidatedState extends YourInfoState {}
