import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../../../core/screens/shader_container.dart';
import '../../../core/widgets/sliding_card_widget.dart';
import '../controller/album/album_controller.dart';
import '../controller/categories/category_playlist_controller.dart';
import '../repository/album/category_playlist_repo.dart';
import '../repository/album/get-album_data_repository.dart';

class CategoryPlaylistScreen extends StatefulWidget {
  static const String routeName = '/playlist';
  final String playlistId;
  final String categoryName;

  const CategoryPlaylistScreen({
    super.key,
    required this.playlistId,
    required this.categoryName,
  });

  @override
  State<CategoryPlaylistScreen> createState() => _CategoryPlaylistScreenState();
}

class _CategoryPlaylistScreenState extends State<CategoryPlaylistScreen> {
  late PageController popularPlaylistPageController;
  late PageController newAndLatestPageController;
  late PageController romanceAlbumPageController;

  double pageOffset = 0;
  double pageOffset1 = 0;
  double pageOffset2 = 0;

  @override
  void initState() {
    super.initState();
    popularPlaylistPageController = PageController(
      viewportFraction: 0.6,
    ); // Increased from 0.6
    newAndLatestPageController = PageController(
      viewportFraction: 0.6,
    );
    romanceAlbumPageController = PageController(
      viewportFraction: 0.6,
    );
    popularPlaylistPageController.addListener(() {
      setState(() {
        pageOffset = popularPlaylistPageController.page!;
      });
    });
    newAndLatestPageController.addListener(() {
      setState(() {
        pageOffset1 = newAndLatestPageController.page!;
      });
    });
    romanceAlbumPageController.addListener(() {
      setState(() {
        pageOffset2 = romanceAlbumPageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.secondaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                widget.categoryName,
                style: GoogleFonts.poppins(
                  color: AppColor.secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.backGroundColor.withOpacity(0.7),
                      AppColor.backGroundColor.withOpacity(0.8),
                      AppColor.backGroundColor,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Popular ${widget.categoryName} Playlists',
                    style: GoogleFonts.poppins(
                      color: AppColor.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final categoryPlaylist = ref
                          .watch(categoryPlaylistProvider(widget.playlistId));
                      return categoryPlaylist.when(
                        data: (data) {
                          List<AlbumItem> allItems = data
                              .map(
                                (item) => AlbumItem(
                                  imageUrl: item.images,
                                  playListId: item.id,
                                ),
                              )
                              .toList();
                          return SlidingCardWidget(
                            allItems: allItems,
                            pageController: popularPlaylistPageController,
                            pageOffset: pageOffset,
                          );
                        },
                        loading: () => SizedBox(
                          height: 250, // Match height of your SlidingCardWidget
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3, // Number of shimmer items
                            itemBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: ShimmerEffect(),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Center(
                          child: Text('Error: $error'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(12),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'New & trending',
                    style: GoogleFonts.poppins(
                      color: AppColor.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final categoryPlaylist =
                          ref.watch(popularAlbumDataProvider);
                      return categoryPlaylist.when(
                        data: (data) {
                          List<AlbumItem> allItems = data
                              .map((item) => AlbumItem(
                                    imageUrl: item.imageUrl,
                                    playListId: item.id,
                                  ))
                              .toList();

                          return SlidingCardWidget(
                            allItems: allItems,
                            pageController: newAndLatestPageController,
                            pageOffset: pageOffset1,
                          );
                        },
                        loading: () => SizedBox(
                          height: 250, // Match height of your SlidingCardWidget
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3, // Number of shimmer items
                            itemBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: ShimmerEffect(),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Center(
                          child: Text('Error: $error'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(12),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '${widget.categoryName} Romance',
                    style: GoogleFonts.poppins(
                      color: AppColor.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final categoryPlaylist = ref
                          .watch(romanceAlbumDataProvider(widget.categoryName));
                      return categoryPlaylist.when(
                        data: (data) {
                          List<AlbumItem> allItems = data
                              .map((item) => AlbumItem(
                                    imageUrl: item.imageUrl,
                                    playListId: item.id,
                                  ))
                              .toList();

                          return SlidingCardWidget(
                            allItems: allItems,
                            pageController: romanceAlbumPageController,
                            pageOffset: pageOffset2,
                          );
                        },
                        loading: () => SizedBox(
                          height: 250, // Match height of your SlidingCardWidget
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3, // Number of shimmer items
                            itemBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: ShimmerEffect(),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Center(
                          child: Text('Error: $error'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(24),
          ),
        ],
      ),
    );
  }
}
