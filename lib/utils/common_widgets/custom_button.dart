import 'package:flutter/material.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: Size(UIHelpers.screenHeight(context) * 0.2, 50),
      ),
      child: child,
    );
  }
}
