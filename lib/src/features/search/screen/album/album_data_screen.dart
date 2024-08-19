import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/widgets/sliding_card_widget.dart';
import '../../controller/album/get_individual_album_data_controller.dart';

class AlbumDataScreen extends StatefulWidget {
  final AlbumItem albumItem;

  const AlbumDataScreen({super.key, required this.albumItem});

  @override
  _AlbumDataScreenState createState() => _AlbumDataScreenState();
}

class _AlbumDataScreenState extends State<AlbumDataScreen> {
  Color? dominantColor;

  @override
  void initState() {
    super.initState();
    _extractDominantColor();
  }

  Future<void> _extractDominantColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.albumItem.imageUrl),
      size: const Size(200, 200), // Reduce the size for faster processing
      maximumColorCount: 10, // Limit the number of colors to analyze
    );

    setState(() {
      dominantColor =
          paletteGenerator.dominantColor?.color ?? AppColor.backGroundColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.secondaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: dominantColor != null
                          ? LinearGradient(
                              colors: [
                                dominantColor!.withOpacity(0.7),
                                dominantColor!.withOpacity(0.54),
                                AppColor.backGroundColor.withOpacity(0.6),
                                AppColor.backGroundColor.withOpacity(0.7),
                                AppColor.backGroundColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : LinearGradient(
                              colors: [
                                AppColor.backGroundColor.withOpacity(0.54),
                                AppColor.backGroundColor.withOpacity(0.6),
                                AppColor.backGroundColor.withOpacity(0.7),
                                AppColor.backGroundColor,
                              ],
                            ),
                    ),
                    padding: const EdgeInsets.only(
                      right: 60,
                      left: 60,
                      top: 60,
                      bottom: 40,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shadowColor: AppColor.backGroundColor,
                      elevation: 10,
                      child: Hero(
                        tag: widget.albumItem.playListId,
                        child: Image.network(
                          widget.albumItem.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: AppColor.backGroundColor,
                      padding: const EdgeInsets.only(
                          left: 20.0), // Padding around the text
                      child: Consumer(
                        builder: (context, ref, child) {
                          final albumData = ref.watch(
                              albumdataProvider(widget.albumItem.playListId));
                          return albumData.when(
                            data: (data) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align text to the left
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      color: Colors
                                          .white, // Text color to contrast the background
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.label,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Tracks: ${data.totalTracks}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
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
                    ),
                  )
                ],
              ),
            ),
          ),
          // Add more content here if needed
          // SliverToBoxAdapter(
          //   child: ,
          // )
        ],
      ),
    );
  }
}
