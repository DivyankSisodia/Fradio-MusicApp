import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/search/screen/album/album_data_screen.dart';


class SlidingCardWidget extends StatelessWidget {
  const SlidingCardWidget({
    super.key,
    required this.allItems,
    required this.pageController,
    required this.pageOffset,
  });

  final List<AlbumItem> allItems;
  final PageController pageController;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: allItems.length,
        controller: pageController,
        padEnds: false,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              print(allItems[i].playListId);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => AlbumDataScreen(
                    albumItem: allItems[i],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width * 0.75,
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: allItems[i].playListId,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: allItems[i].imageUrl,
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.75,
                    fit: BoxFit.cover,
                    alignment: Alignment(
                      (-pageOffset + i * 0.95) * 2.5,
                      0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class AlbumItem {
  final String imageUrl;
  final String playListId;

  AlbumItem({required this.imageUrl, required this.playListId});
}
