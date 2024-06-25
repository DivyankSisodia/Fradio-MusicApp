import 'package:flutter/material.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/core/constant/size/app_size.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Fradio',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.tertiaryColor.withOpacity(0.5),
                          ),
                        ),
                        const Gap(5),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.tertiaryColor,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.extraColor,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Keep Jamming mates!!',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: appSize.mdfontsize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: appSize.lgmargin,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
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
                        margin:
                            EdgeInsets.symmetric(vertical: appSize.lgmargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.maximize_circle,
                              color: AppColor.backGroundColor,
                              size: 20,
                            ),
                            const Text(
                              'Sign Up with Email',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: appSize.lgmargin,
                  //   ),
                  //   height: appSize.mdcontainer,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: AppColor.secondaryColor,
                  //     borderRadius: BorderRadius.circular(appSize.lgradius),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       'Sign Up',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: appSize.mdheight,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Gap(appSize.mdgap),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: appSize.lgmargin,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
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
                        margin:
                            EdgeInsets.symmetric(vertical: appSize.lgmargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.maximize_circle,
                              color: AppColor.backGroundColor,
                              size: 20,
                            ),
                            const Text(
                              'Sign Up with Email',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: appSize.lgmargin,
                  //   ),
                  //   height: appSize.mdcontainer,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: AppColor.secondaryColor,
                  //       width: 2,
                  //     ),
                  //     color: AppColor.backGroundColor,
                  //     borderRadius: BorderRadius.circular(appSize.lgradius),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //           left: appSize.xlpadding,
                  //         ),
                  //         child: Icon(
                  //           const FaIcon(FontAwesomeIcons.google).icon,
                  //           color: AppColor.secondaryColor,
                  //           size: appSize.mdiconsize,
                  //         ),
                  //       ),
                  //       const Gap(10),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: appSize.mdpadding,
                  //         ),
                  //         child: Text(
                  //           'Continue with Google',
                  //           style: TextStyle(
                  //             color: AppColor.secondaryColor,
                  //             fontSize: appSize.mdheight,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Gap(appSize.mdgap),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: appSize.lgmargin,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
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
                        margin:
                            EdgeInsets.symmetric(vertical: appSize.lgmargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.maximize_circle,
                              color: AppColor.backGroundColor,
                              size: 20,
                            ),
                            const Text(
                              'Sign Up with Email',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: appSize.lgmargin,
                  //   ),
                  //   height: appSize.mdcontainer,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: AppColor.secondaryColor,
                  //       width: 2,
                  //     ),
                  //     color: AppColor.backGroundColor,
                  //     borderRadius: BorderRadius.circular(appSize.lgradius),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //           left: appSize.xlpadding,
                  //         ),
                  //         child: Icon(
                  //           Iconsax.mobile,
                  //           color: AppColor.secondaryColor,
                  //           size: appSize.mdiconsize,
                  //         ),
                  //       ),
                  //       const Gap(10),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: appSize.mdpadding,
                  //         ),
                  //         child: Text(
                  //           'Continue with Phone Number',
                  //           style: TextStyle(
                  //             color: AppColor.secondaryColor,
                  //             fontSize: appSize.mdheight,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Gap(appSize.mdgap),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: appSize.lgmargin,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
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
                        margin:
                            EdgeInsets.symmetric(vertical: appSize.lgmargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.maximize_circle,
                              color: AppColor.backGroundColor,
                              size: 20,
                            ),
                            const Text(
                              'Sign Up with Email',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(appSize.lggap),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: appSize.mdfontsize,
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
