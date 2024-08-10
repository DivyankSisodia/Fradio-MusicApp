import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.firstName,
  });

  final String firstName;

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return SliverAppBar(
      backgroundColor: AppColor.backGroundColor,
      pinned: true,
      surfaceTintColor: AppColor.secondaryColor,
      expandedHeight: 80,
      elevation: 10,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
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
                      'Good Afternoon',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
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
                      if (currentUser != null && currentUser.photoURL != null)
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            currentUser.photoURL!,
                          ),
                        )
                      else
                        const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.person),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
