import 'package:flutter/material.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../../../core/constant/size/app_size.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
    required this.appSize,
    required this.text,
    required this.icon,
    required this.iconsize,
    required this.onPressed,
  });

  final MyAppSize appSize;
  final String text;
  final IconData icon;
  final double iconsize;
  final VoidCallback onPressed;

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
          overlayColor: Colors.grey.withOpacity(0.5),
          backgroundColor: AppColor.backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: appSize.lgmargin),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                child: Icon(
                  icon,
                  color: AppColor.secondaryColor,
                  size: iconsize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
