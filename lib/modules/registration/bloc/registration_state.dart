part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class SelectedGender extends RegistrationState {
  SelectedGender(this.gender);
  final int gender;
}

class FormValidatedState extends RegistrationState {}

class ImagePickedState extends RegistrationState {
  final File? image;

  ImagePickedState(this.image);
}
