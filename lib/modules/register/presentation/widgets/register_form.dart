import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/register/presentation/bloc/register_bloc.dart';
import 'package:weather_app/utils/common_widgets/app_input_validations.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/common_widgets/app_input_field.dart';
import 'package:weather_app/utils/common_widgets/custom_button.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.passController,
    required this.confirmPassController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration Successful'),
              backgroundColor: AppColors.green,
            ),
          );
          Navigator.pushNamed(context, '/login');
        }
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              AppInputField(
                controller: emailController,
                hint: 'Enter Email',
                label: 'Email',
                validator: (value) => Validations.validateEmail(value),
              ),
              UIHelpers.verticalSpaceMedium,
              AppInputField(
                controller: passController,
                hint: 'Enter Password',
                label: 'Password',
                password: !state.isPasswordVisible,
                trailing: IconButton(
                  icon: Icon(state.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    context
                        .read<RegisterBloc>()
                        .add(TogglePasswordVisibility());
                  },
                ),
                validator: (value) => Validations.passwordValidation(value),
              ),
              UIHelpers.verticalSpaceMedium,
              AppInputField(
                controller: confirmPassController,
                hint: 'Enter Confirm Password',
                label: 'Confirm Password',
                password: !state.isPasswordVisible,
                trailing: IconButton(
                  icon: Icon(state.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    context
                        .read<RegisterBloc>()
                        .add(TogglePasswordVisibility());
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  } else if (value != passController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              UIHelpers.verticalSpaceLarge,
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passController.text;
                    final confirmPassword = confirmPassController.text;

                    context.read<RegisterBloc>().add(
                          RegisterSubmitted(
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                          ),
                        );
                  },
                  backgroundColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  child: state.status == RegisterStatus.loading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.white),
                        )
                      : Text(
                          'Sign up',
                          style: AppTypography.text18WhiteBold,
                        ),
                ),
              ),
              if (state.errorMessage.isNotEmpty) ...[
                UIHelpers.verticalSpaceMedium,
                Text(
                  state.errorMessage,
                  style: AppTypography.text14Red,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
