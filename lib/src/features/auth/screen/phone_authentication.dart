import 'package:flutter/material.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/features/auth/repository/phone_auth_repository.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/size/app_size.dart';
import '../../../core/utils/validator.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widget/logo_heading.dart';
import '../widget/registration_buttons.dart';

class PhoneAuthScreen extends StatelessWidget {
  static const String routeName = '/phone-auth';
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController phoneController = TextEditingController();
    final PhoneAuth phoneAuth = PhoneAuth();

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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your phone number',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'We will send you a verification code',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Form(
                          key: formKey,
                          child: CustomTextFields(
                            controller: phoneController,
                            validator: Validator().validatePhoneNumber,
                            hintext: 'Enter your Phone Number',
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(appSize.lggap),
                  RegistrationButton(
                    appSize: appSize,
                    text: 'Continue',
                    textColor: AppColor.secondaryColor,
                    backgroundColor: AppColor.tertiaryColor,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        // Handle form submission or navigation here
                        phoneAuth.signInWithPhone(
                          phoneController.text,
                          context,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

