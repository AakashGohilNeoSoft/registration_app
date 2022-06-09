part of 'your_info_bloc.dart';

@immutable
abstract class YourInfoEvent {}

class SelectEducationEvent extends YourInfoEvent {
  final dynamic value;

  SelectEducationEvent(this.value);
}

class SelectYearOfPassingEvent extends YourInfoEvent {
  final dynamic value;

  SelectYearOfPassingEvent(this.value);
}

class SelectDesignationEvent extends YourInfoEvent {
  final dynamic value;

  SelectDesignationEvent(this.value);
}

class SelectDomainEvent extends YourInfoEvent {
  final dynamic value;

  SelectDomainEvent(this.value);
}

class SubmitYourInfoEvent extends YourInfoEvent {
  final FormState formState;

  SubmitYourInfoEvent(this.formState);
}
