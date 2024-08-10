import 'package:riverpod/riverpod.dart';

import '../model/playlist_track_model.dart';
import '../repository/get_playlist_track.dart';

final playlistdataProvider = Provider<GetPlaylistTrack>((ref) {
  return GetPlaylistTrack();
});

final getPlaylistTrackProvider =
    FutureProvider.family<List<PlayListTrackModel>, String>(
        (ref, playlistId) async {
  final res = ref.watch(playlistdataProvider);
  return res.getPlaylistTracks(playlistId);
});
