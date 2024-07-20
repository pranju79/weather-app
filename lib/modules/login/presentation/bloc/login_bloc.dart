import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    // Registering event handlers
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  // Toggles the password visibility state
  FutureOr<void> _togglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  // Handles the login submission event
  FutureOr<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'All fields are required'));
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));

    // Simulate a network call with a delay
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(status: LoginStatus.success));
  }
}
