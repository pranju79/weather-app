part of 'register_bloc.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final bool isPasswordVisible;
  final RegisterStatus status;
  final String errorMessage;

  const RegisterState({
    this.isPasswordVisible = false,
    this.status = RegisterStatus.initial,
    this.errorMessage = '',
  });

  RegisterState copyWith({
    bool? isPasswordVisible,
    RegisterStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible, status, errorMessage];
}
