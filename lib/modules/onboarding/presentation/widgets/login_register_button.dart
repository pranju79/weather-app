import 'package:flutter/material.dart';
import 'package:weather_app/utils/common_widgets/custom_button.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            backgroundColor: AppColors.primary,
            borderColor: AppColors.primary,
            child: Text(
              'Login',
              style: AppTypography.text18WhiteBold,
            ),
          ),
        ),
        UIHelpers.horizontalSpaceSmallRegular,
        Flexible(
          child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            backgroundColor: AppColors.white,
            borderColor: AppColors.primary,
            child: Text(
              'Register',
              style: AppTypography.text18BlueBold,
            ),
          ),
        ),
      ],
    );
  }
}
