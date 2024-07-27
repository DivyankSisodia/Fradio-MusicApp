import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fradio/src/features/home/widgets/chip.dart';

import '../../../core/constant/texts/data.dart';
import '../controllers/chip_controller.dart';

class MusicVariations extends StatelessWidget {
  const MusicVariations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Consumer(
          builder: (context, ref, child) {
            final selectedIndex = ref.watch(selectedChipProvider);
            return SizedBox(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ChipWidget(
                    title: data[index],
                    isSelected: index == selectedIndex,
                    onPressed: () {
                      ref.read(selectedChipProvider.notifier).state =
                          index;
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}