import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/core/constant/texts/data.dart';
import 'package:fradio/src/features/home/widgets/chip.dart';

import '../controllers/chip_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullName = FirebaseAuth.instance.currentUser!.displayName;

    String firstName = fullName!.split(' ')[0];

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.backGroundColor,
              pinned: true,
              surfaceTintColor: AppColor.secondaryColor,
              expandedHeight: 80,
              elevation: 10,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "👋 Hi $firstName!",
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Good AfterNoon',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Navigator.of(context).pushNamed('/profile');
                              },
                              icon: const Icon(
                                Icons.notification_important,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                FirebaseAuth.instance.currentUser!.photoURL!,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Consumer(
                  builder: (context, ref, child) {
                    final selectedIndex = ref.watch(selectedChipProvider);
                    return SizedBox(
                      height: 40,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
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
            )
          ],
        ),
      ),
    );
  }
}
