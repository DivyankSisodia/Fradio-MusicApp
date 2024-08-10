import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../bottom_navbar.dart';
import '../../../core/constant/colors/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 10,
      ),
      child: Row(
        children: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                icon: const Icon(
                  Iconsax.arrow_left_2,
                  color: AppColor.secondaryColor,
                ),
                onPressed: () {
                  ref.read(bottomNavIndexProvider.notifier).state = 0;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/main',
                    (route) => true,
                  );
                },
              );
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.primaryColor,
                hintText: 'Search songs, albums, artists ....',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: AppColor.backGroundColor,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 15.0,
                  ),
                  child: Icon(
                    Iconsax.search_normal,
                    color: AppColor.backGroundColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColor.secondaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColor.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
