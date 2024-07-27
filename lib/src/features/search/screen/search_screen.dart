import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fradio/src/core/constant/colors/app_colors.dart';
import 'package:fradio/src/features/search/controller/category_controller.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../home/controllers/popular_artist_controller.dart';
import '../../home/screen/popular_artists.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
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
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final homeDataAsyncValue = ref.watch(homeDataProvider);

                return homeDataAsyncValue.when(
                  data: (homeData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Iconsax.trend_up4,
                                color: AppColor.secondaryColor,
                              ),
                              const Gap(12),
                              Text(
                                'Trending Artists',
                                style: TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          if (homeData.popularArtists.isNotEmpty)
                            PopularArtistsWidget(
                              popularArtists: homeData.popularArtists,
                            ),
                        ],
                      ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.browse_gallery_outlined,
                    color: AppColor.secondaryColor,
                  ),
                  const Gap(12),
                  Text(
                    'Browse',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(8),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.48,
              child: Consumer(
                builder: (context, ref, child) {
                  final categoryList = ref.watch(categoriesProvider);
                  return categoryList.when(
                    data: (categoryData) {
                      return MasonryGridView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount:
                            categoryData.length - 1, // Exclude the first item
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final category = categoryData[
                              index + 1]; // Start from the second item
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the category playlist screen
                              print('Category: ${category.id}');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: AppColor.secondaryColor,
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: category.icon,
                                        cacheKey: category.icon,
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: AppColor.secondaryColor,
                                        ),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                      letterSpacing: 1.1,
                                      color: AppColor.secondaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text('Error: $error'),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
