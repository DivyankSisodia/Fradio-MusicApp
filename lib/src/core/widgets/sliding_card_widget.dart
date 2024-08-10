import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SlidingCardWidget extends StatelessWidget {
  const SlidingCardWidget({
    super.key,
    required this.allImageUrls,
    required this.pageController,
    required this.pageOffset,
  });

  final List<String> allImageUrls;
  final PageController pageController;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: allImageUrls.length,
        controller: pageController,
        padEnds: false, // This removes padding at the start and end
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(8), // Add padding only to the right
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: allImageUrls[i],
                height: 250, // Match viewportFraction
                fit: BoxFit.cover,
                alignment: Alignment(
                  (-pageOffset + i * 0.95) * 2.5, // Adjusted parallax effect
                  0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
