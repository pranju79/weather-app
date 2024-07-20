import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    // Register event handlers for events
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  FutureOr<void> _togglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  // Handles the registration process when the RegisterSubmitted event is added.
  FutureOr<void> _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    if (event.email.isEmpty ||
        event.password.isEmpty ||
        event.confirmPassword.isEmpty) {
      emit(state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: 'All fields are required'));
      return;
    }

    // Check if passwords match
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: 'Passwords do not match'));
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading));

    // Simulate network call
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(status: RegisterStatus.success));
  }
}
