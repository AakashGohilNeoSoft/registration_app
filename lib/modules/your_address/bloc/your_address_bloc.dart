import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'your_address_event.dart';
part 'your_address_state.dart';

class YourAddressBloc extends Bloc<YourAddressEvent, YourAddressState> {
  YourAddressBloc() : super(YourAddressInitial()) {
    on<SelectStateEvent>((event, emit) {
      emit(StateSelectedState(event.value));
    });
    on<SubmitEvent>((event, emit) {
      if (event.formState.validate()) {
        emit(RegistrationSuccessfulState());
      }
    });
  }
}
