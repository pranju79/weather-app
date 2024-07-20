import 'package:flutter/material.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_icons.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class ContinueOptions extends StatelessWidget {
  const ContinueOptions({super.key});

  @override
  Widget build(BuildContext context) {
    // Build a row to display clickable icons for social media login options
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildClickableIcon(AppIcons.google),
        UIHelpers.horizontalSpaceRegular,
        _buildClickableIcon(AppIcons.facebook),
        UIHelpers.horizontalSpaceRegular,
        _buildClickableIcon(AppIcons.apple),
      ],
    );
  }

  Widget _buildClickableIcon(IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle the tap
      },
      child: Container(
        width: 44,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.grey1,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
