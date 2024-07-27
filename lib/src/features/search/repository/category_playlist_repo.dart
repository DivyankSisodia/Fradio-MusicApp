import 'package:fradio/src/config/api_keys/spotify/spotify_apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/category_playlist_model.dart';

class CategoryPlaylist {
  Future<List<CategoryPlaylistModel>> getCategoryPlaylist(String id) async {
    String baseUrl = SpotifyApis.categories;
    String categoryUrl = '$baseUrl/$id/playlists';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token')!;

    final response = await  http.get(
      Uri.parse(categoryUrl),
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.body as Map<String, dynamic>;
      return (data['playlists']['items'] as List)
          .map((item) => CategoryPlaylistModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to get category playlist');
    }
  }
}
