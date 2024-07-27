import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../model/popular_radio_model.dart';

class PopularRadioWidget extends StatelessWidget {
  const PopularRadioWidget({
    super.key,
    required this.popularRadios,
  });

  final List<PopularRadioModel> popularRadios;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularRadios.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.greenAccent,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      popularRadios[index].images,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    popularRadios[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
