import 'package:fradio/src/features/search/model/album/album_model.dart';
import 'package:riverpod/riverpod.dart';

import '../../repository/album/category_playlist_repo.dart';

final popularAlbumProvider = Provider<CategoryPlaylist>((ref) {
  return CategoryPlaylist();
});

final popularAlbumDataProvider = FutureProvider.autoDispose((ref) async {
  final res = ref.watch(popularAlbumProvider);
  return res.getAlbums();
});

final romanceAlbumProvider = Provider<CategoryPlaylist>((ref) {
  return CategoryPlaylist();
});

final romanceAlbumDataProvider = FutureProvider.family<List<AlbumModel>, String>((ref, String name) async {
  final res = ref.watch(romanceAlbumProvider);
  return res.romanceAlbum(name);
});