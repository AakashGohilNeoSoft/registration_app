part of 'your_address_bloc.dart';

@immutable
abstract class YourAddressState {}

class YourAddressInitial extends YourAddressState {}

class StateSelectedState extends YourAddressState {
  final dynamic value;

  StateSelectedState(this.value);
}

class RegistrationSuccessfulState extends YourAddressState {}
