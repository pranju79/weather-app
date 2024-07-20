import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/login/presentation/bloc/login_bloc.dart';
import 'package:weather_app/utils/common_widgets/app_input_validations.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/common_widgets/app_input_field.dart';
import 'package:weather_app/utils/common_widgets/custom_button.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // If login is successful, show a success snackbar and navigate to the dashboard
        if (state.status == LoginStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Successful'),
              backgroundColor: AppColors.green,
            ),
          );
          Navigator.pushNamed(context, '/dashboard');
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
                    context.read<LoginBloc>().add(TogglePasswordVisibility());
                  },
                ),
                validator: (value) => Validations.passwordValidation(value),
              ),
              UIHelpers.verticalSpaceMedium,
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot your password?',
                    style: AppTypography.text16Blue,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              UIHelpers.verticalSpaceMedium,
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passController.text;

                    context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: email,
                            password: password,
                          ),
                        );
                  },
                  backgroundColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  child: state.status == LoginStatus.loading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.white),
                        )
                      : Text(
                          'Sign in',
                          style: AppTypography.text18WhiteBold,
                        ),
                ),
              ),
              // Display error message if login fails
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
