import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/categories/category_playlist_model.dart';
import '../../repository/album/category_playlist_repo.dart';

final playlistProvider = Provider<CategoryPlaylist>((ref) {
  return CategoryPlaylist();
});

final categoryPlaylistProvider = FutureProvider.family<List<CategoryPlaylistModel>, String>((ref, categoryId) async {
  final res = ref.watch(playlistProvider);
  return res.getCategoryPlaylist(categoryId);
});