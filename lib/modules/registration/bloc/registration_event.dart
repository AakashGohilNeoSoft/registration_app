part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class MaleSelectedEvent extends RegistrationEvent {}

class FemaleSelectedEvent extends RegistrationEvent {}

class PickImageEvent extends RegistrationEvent {
  final ImagePicker imagePicker;

  PickImageEvent({required this.imagePicker});
}

class NextButtonPressedEvent extends RegistrationEvent {
  final FormState formState;

  NextButtonPressedEvent(this.formState);
}
