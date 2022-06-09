import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<MaleSelectedEvent>((event, emit) {
      emit(SelectedGender(1));
    });
    on<FemaleSelectedEvent>((event, emit) {
      emit(SelectedGender(2));
    });
    on<NextButtonPressedEvent>((event, emit) {
      if (event.formState.validate()) {
        emit(FormValidatedState());
      }
    });
    on<PickImageEvent>((event, emit) async {
      await pickImage(event.imagePicker);
      emit(ImagePickedState(profilePhoto));
    });
  }
  File? profilePhoto;
  pickImage(ImagePicker imagePicker) async {
    try {
      XFile? pickedPhoto =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedPhoto != null) {
        profilePhoto = File(pickedPhoto.path);
      }
    } catch (e) {
      throw (e.toString());
    }
    return null;
  }
}
