import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../../../core/constant/size/app_size.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    super.key,
    required this.appSize,
  });

  final MyAppSize appSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  color: AppColor.secondaryColor,
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
    );
  }
}
