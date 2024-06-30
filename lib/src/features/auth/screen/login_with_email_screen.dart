import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/core/utils/validator.dart';
import 'package:fradio/src/features/auth/widget/registration_buttons.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/size/app_size.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../home/screen/home_screen.dart';
import '../provider/login_with_email_provider.dart';
import '../widget/logo_heading.dart';

class EmailLoginScreen extends ConsumerWidget {
  static const String routeName = '/email-login';
  const EmailLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login with Email',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(appSize.lggap),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextFields(
                        controller: emailController,
                        hintext: 'Email',
                        obscureText: false,
                        validator: Validator().validateEmail,
                      ),
                    ),
                    Gap(appSize.lggap),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextFields(
                        controller: passwordController,
                        hintext: 'Password',
                        obscureText: true,
                        validator: Validator().validatePassword,
                      ),
                    ),
                    Gap(appSize.lggap),
                    RegistrationButton(
                      appSize: appSize,
                      text: 'Sign Up',
                      textColor: AppColor.primaryColor,
                      backgroundColor: AppColor.tertiaryColor,
                      onPressed: () async {
                        if (formKey.currentState?.validate() == true) {
                          await ref.read(emailAuthProvider).createUserAccount(
                                emailController.text,
                                passwordController.text,
                                context,
                              );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
