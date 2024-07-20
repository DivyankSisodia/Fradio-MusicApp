import 'package:flutter/material.dart';

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
    );
  }
}
