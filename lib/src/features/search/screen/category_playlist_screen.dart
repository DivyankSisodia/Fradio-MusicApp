import 'package:flutter/material.dart';

class CategoryPlaylistScreen extends StatelessWidget {
   static const String routeName = '/playlist';
  final String playlistId;

  const CategoryPlaylistScreen({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Category Playlist'),
    ));
  }
}
