part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class TogglePasswordVisibility extends RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterSubmitted(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}
