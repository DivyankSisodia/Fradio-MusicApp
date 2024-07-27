import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  BottomNavBar({super.key});

  final List<String> screenNames = ['Home', 'Search', 'Library', 'Profile'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: const BoxDecoration(
        backgroundBlendMode: BlendMode.screen,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 66, 65, 65),
            Color.fromARGB(255, 45, 45, 45),
            Colors.black,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: FlashyTabBar(
          animationCurve: Curves.easeIn,
          animationDuration: Durations.medium4,
          showElevation: true,
          backgroundColor: Colors.transparent,
          selectedIndex: selectedIndex,
          items: [
            FlashyTabBarItem(
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: AppColor.activeTabColor,
                  fontSize: 12,
                ),
              ),
              inactiveColor: AppColor.inactiveTabColor,
              activeColor: AppColor.activeTabColor,
            ),
            FlashyTabBarItem(
                icon: const Icon(Icons.search),
                title: const Text('Search',
                    style: TextStyle(color: AppColor.activeTabColor)),
                inactiveColor: AppColor.inactiveTabColor,
                activeColor: AppColor.activeTabColor),
            FlashyTabBarItem(
                icon: const Icon(Icons.library_music),
                title: const Text('Library',
                    style: TextStyle(color: AppColor.activeTabColor)),
                inactiveColor: AppColor.inactiveTabColor,
                activeColor: AppColor.activeTabColor),
            FlashyTabBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile',
                  style: TextStyle(color: AppColor.activeTabColor)),
              inactiveColor: AppColor.inactiveTabColor,
              activeColor: AppColor.activeTabColor,
            ),
          ],
          onItemSelected: (index) {
            ref.read(bottomNavIndexProvider.notifier).state = index;
          },
        ),
      ),
    );
  }
}

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
