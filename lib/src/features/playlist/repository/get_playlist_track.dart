import 'dart:convert';

import 'package:fradio/src/config/api_keys/spotify/spotify_apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../model/playlist_track_model.dart';

class GetPlaylistTrack {
  Future<List<PlayListTrackModel>> getPlaylistTracks(String id) async {
    String baseUrl = SpotifyApis.playlist;
    String playlistTrackUrl = '$baseUrl/$id/tracks';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token')!;

    final response = await http.get(Uri.parse(playlistTrackUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('track details $data');
      return (data['items'] as List)
          .map((item) => PlayListTrackModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to get playlist tracks');
    }
  }
}
