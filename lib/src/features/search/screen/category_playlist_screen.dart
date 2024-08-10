import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../../../core/widgets/sliding_card_widget.dart';
import '../controller/category_playlist_controller.dart';

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
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(viewportFraction: 0.6); // Increased from 0.6
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
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
                Consumer(
                  builder: (context, ref, child) {
                    final categoryPlaylist =
                        ref.watch(categoryPlaylistProvider(widget.playlistId));
                    return categoryPlaylist.when(
                      data: (data) {
                        List<String> allImageUrls =
                            data.map((item) => item.images).toList();

                        return SlidingCardWidget(
                          allImageUrls: allImageUrls,
                          pageController: pageController,
                          pageOffset: pageOffset,
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
        ],
      ),
    );
  }
}
