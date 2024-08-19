import 'dart:convert';

import 'package:fradio/src/config/api_keys/spotify/spotify_apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/album/album_model.dart';
import '../../model/categories/category_playlist_model.dart';

class CategoryPlaylist {
  Future<List<CategoryPlaylistModel>> getCategoryPlaylist(String id) async {
    String baseUrl = SpotifyApis.categories;
    String categoryUrl = '$baseUrl/$id/playlists';

    print(categoryUrl);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token')!;

    final response = await http.get(Uri.parse(categoryUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return (data['playlists']['items'] as List)
            .map((item) => CategoryPlaylistModel.fromJson(item))
            .toList();
      } else {
        print('Error: ${response.reasonPhrase}');
        throw Exception('Failed to get category playlist');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get category playlist');
    }
  }

  Future<List<AlbumModel>> getAlbums() async {
    String baseUrl = SpotifyApis.search;
    String albumUrl =
        '$baseUrl?q=new+%26+trending&type=album&market=IN&limit=15';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token')!;

    print('album token $token');

    final response = await http.get(Uri.parse(albumUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print(data);
        return (data['albums']['items'] as List)
            .map((item) => AlbumModel.fromJson(item))
            .toList();
      } else {
        print('Error: ${response.reasonPhrase}');
        throw Exception('Failed to get albums');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get albums');
    }
  }

  Future<List<AlbumModel>> romanceAlbum(String name) async {
    String baseUrl = SpotifyApis.search;
    String albumUrl = '$baseUrl?q=$name+romance&type=album';

    print(albumUrl);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token')!;

    final response = await http.get(Uri.parse(albumUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print(data);
        return (data['albums']['items'] as List)
            .map((item) => AlbumModel.fromJson(item))
            .toList();
      } else {
        print('Error: ${response.reasonPhrase}');
        throw Exception('Failed to get albums');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get albums');
    }
  }
}
