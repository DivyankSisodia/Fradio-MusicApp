import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/core/constant/size/app_size.dart';
import 'package:fradio/src/features/auth/screen/login_with_email_screen.dart';
import 'package:fradio/src/features/auth/widget/registration_buttons.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../repository/google_signin_repository.dart';
import '../widget/logo_heading.dart';
import '../widget/social_login_button.dart';
import 'phone_authentication.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSize = MyAppSize.instance;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: LogoHeader(appSize: appSize),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegistrationButton(
                    appSize: appSize,
                    text: 'Sign Up with Email',
                    textColor: AppColor.backGroundColor,
                    backgroundColor: AppColor.secondaryColor,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(EmailLoginScreen.routeName);
                    },
                  ),
                  Gap(appSize.mdgap),
                  SocialLoginButtons(
                    appSize: appSize,
                    text: 'Continue with Phone Number',
                    icon: Iconsax.mobile,
                    iconsize: 20,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(PhoneAuthScreen.routeName);
                    },
                  ),
                  Gap(appSize.mdgap),
                  SocialLoginButtons(
                    appSize: appSize,
                    text: 'Continue with Google',
                    icon: FontAwesomeIcons.google,
                    iconsize: 20,
                    onPressed: () {
                      GoogleSignMethod().signInWithGoogle(context);
                    },
                  ),
                  Gap(appSize.mdgap),
                  SocialLoginButtons(
                    appSize: appSize,
                    text: 'Continue with Apple',
                    icon: FontAwesomeIcons.apple,
                    iconsize: 24,
                    onPressed: () {},
                  ),
                  Gap(appSize.lggap),
                  Text(
                    'Log in',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: appSize.lgfontsize,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
