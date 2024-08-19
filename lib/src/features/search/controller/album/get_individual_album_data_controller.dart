import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fradio/src/features/search/model/album/album_data_model.dart';
import 'package:fradio/src/features/search/repository/album/get-album_data_repository.dart';

final individualAbumProvider = Provider<GetAlbumDataRepository>((ref) {
  return GetAlbumDataRepository();
});

final albumdataProvider =
    FutureProvider.family<AlbumDataModel, String>((ref, String id) async {
  final res = ref.watch(individualAbumProvider);
  return res.getParticularAlbumData(id);
});
