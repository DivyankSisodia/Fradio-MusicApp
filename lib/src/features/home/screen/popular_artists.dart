import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/colors/app_colors.dart';
import '../model/popular_artists_model.dart';

class PopularArtistsWidget extends StatelessWidget {
  const PopularArtistsWidget({
    super.key,
    required this.popularArtists,
  });

  final List<PopularArtistsModel> popularArtists;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
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
                  backgroundColor: Colors
                      .transparent, // Optional: to ensure the background is transparent
                  radius: 40,
                  child: ClipOval(
                    child: GestureDetector(
                      onTap: () {
                        print(popularArtists[index].id);
                      },
                      child: CachedNetworkImage(
                        imageUrl: popularArtists[index].visuals,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(), // Optional: a placeholder widget while the image loads
                        errorWidget: (context, url, error) => const Icon(Icons
                            .error), // Optional: an error widget if the image fails to load
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  width: 80,
                  child: Center(
                    child: Text(
                      maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      popularArtists[index].name,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.secondaryColor,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
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
