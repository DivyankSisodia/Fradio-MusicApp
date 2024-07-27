import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:gap/gap.dart';

import '../../../config/api_keys/spotify/spotify_apis.dart';
import '../../../core/utils/spotify_authorization.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../search/repository/get_categories_repository.dart';
import '../controllers/popular_artist_controller.dart';
import '../widgets/music_variation_chip.dart';
import 'popluar_radio.dart';
import 'popular_album.dart';
import 'popular_artists.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Call the function to get the access token
    getAccessToken(SpotifyCredentials.clientId, SpotifyCredentials.clientSecret);
    GetCategories().getCategories();
  }

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
            // Home AppBar
            CustomAppBar(firstName: firstName),

            // Music Variations chips list
            const MusicVariations(),

            // Popular Artists, Albums and Radio Playlists
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Consumer(
                      builder: (context, ref, child) {
                        final homeDataAsyncValue = ref.watch(homeDataProvider);

                        return homeDataAsyncValue.when(
                          data: (homeData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Popular Artists',
                                  style: TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                if (homeData.popularArtists.isNotEmpty)
                                  PopularArtistsWidget(
                                      popularArtists: homeData.popularArtists),
                                const Gap(10),
                                const Text(
                                  'Popular Albums',
                                  style: TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                if (homeData.popularAlbums.isNotEmpty)
                                  PopularAlbumWidget(
                                      popularAlbums: homeData.popularAlbums),
                                const Gap(20),
                                const Text(
                                  'Popular Radio Playlists',
                                  style: TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                if (homeData.popularRadios.isNotEmpty)
                                  PopularRadioWidget(
                                      popularRadios: homeData.popularRadios),
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