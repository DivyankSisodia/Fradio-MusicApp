import 'package:flutter/material.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../../../core/constant/size/app_size.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    super.key,
    required this.appSize,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
  });

  final MyAppSize appSize;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appSize.lgmargin,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: AppColor.secondaryColor,
            width: 2,
          ),
          overlayColor: Colors.grey,
          backgroundColor:  backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: appSize.mdmargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
