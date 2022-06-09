part of 'your_address_bloc.dart';

@immutable
abstract class YourAddressEvent {}

class SelectStateEvent extends YourAddressEvent {
  final dynamic value;

  SelectStateEvent(this.value);
}

class SubmitEvent extends YourAddressEvent {
  final FormState formState;

  SubmitEvent(this.formState);
}
