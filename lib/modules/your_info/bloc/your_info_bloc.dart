import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'your_info_event.dart';
part 'your_info_state.dart';

class YourInfoBloc extends Bloc<YourInfoEvent, YourInfoState> {
  YourInfoBloc() : super(YourInfoInitial()) {
    on<SelectEducationEvent>((event, emit) {
      emit(EducationSelectedState(event.value));
    });
    on<SelectYearOfPassingEvent>((event, emit) {
      emit(YearOfPassingSelectedState(event.value));
    });
    on<SelectDesignationEvent>((event, emit) {
      emit(DesignationSelectedState(event.value));
    });
    on<SelectDomainEvent>((event, emit) {
      emit(DomainSelectedState(event.value));
    });
    on<SubmitYourInfoEvent>((event, emit) {
      if (event.formState.validate()) {
        emit(YourInfoValidatedState());
      }
    });
  }
}
