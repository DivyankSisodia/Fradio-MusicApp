import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/core/constant/texts/data.dart';
import 'package:fradio/src/features/home/widgets/chip.dart';

import '../controllers/chip_controller.dart';
import '../controllers/popular_artist_controller.dart';
import '../model/popular_albums_model.dart';
import '../model/popular_artists_model.dart';

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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular Artists',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer(
                      builder: (context, ref, child) {
                        final homeData = ref.watch(fetchHomeDataProvider);

                        return homeData.when(
                          data: (data) {
                            List<PopularArtistsModel> popularArtists = [];
                            List<PopularAlbumModel> popularAlbums = [];

                            final List<dynamic> sections =
                                data['sections']['items'];

                            for (var section in sections) {
                              if (section['type'] == 'section' &&
                                  section['title'] == 'Popular artists') {
                                final List<dynamic> items =
                                    section['contents']['items'];
                                popularArtists = items
                                    .where((item) => item['type'] == 'artist')
                                    .map((item) =>
                                        PopularArtistsModel.fromJson(item))
                                    .toList();
                              } else if (section['type'] == 'section' &&
                                  section['title'] == 'Popular albums') {
                                final List<dynamic> items =
                                    section['contents']['items'];
                                popularAlbums = items
                                    .where((item) => item['type'] == 'album')
                                    .map((item) =>
                                        PopularAlbumModel.fromJson(item))
                                    .toList();
                              }
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (popularArtists.isNotEmpty)
                                  SizedBox(
                                    height: 120,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: popularArtists.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  popularArtists[index]
                                                      .visuals
                                                      .avatar
                                                      .url,
                                                ),
                                                radius: 40,
                                              ),
                                              const SizedBox(height: 8),
                                              SizedBox(
                                                height: 20,
                                                width: 75,
                                                child: Center(
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    popularArtists[index].name,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: AppColor
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Popular Albums',
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (popularAlbums.isNotEmpty)
                                  SizedBox(
                                    height: 120,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: popularAlbums.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  popularAlbums[index]
                                                      .cover
                                                      .first
                                                      .url,
                                                ),
                                                radius: 40,
                                              ),
                                              const SizedBox(height: 8),
                                              SizedBox(
                                                height: 20,
                                                width: 75,
                                                child: Center(
                                                  child: Text(
                                                    popularAlbums[index].name,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: AppColor
                                                            .secondaryColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            );
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          error: (error, stackTrace) => Center(
                            child: Text('Error: $error'),
                          ),
                        );
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
