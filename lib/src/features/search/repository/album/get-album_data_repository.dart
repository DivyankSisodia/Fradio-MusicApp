import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/api_keys/spotify/spotify_apis.dart';
import '../../model/album/album_data_model.dart';

class GetAlbumDataRepository {
  Future<AlbumDataModel> getParticularAlbumData(String id) async {
    // Construct the album URL
    String baseurl = SpotifyApis.album;
    String albumUrl = '$baseurl/$id';

    // Get the token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    if (token == null) {
      throw Exception('No access token found');
    }

    // Fetch data from API
    final response = await http.get(
      Uri.parse(albumUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        // Parse the JSON response and return the AlbumDataModel
        print('Album data: $data');
        return AlbumDataModel.fromJson(data);
      } else {
        throw Exception('Failed to load album data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get album data');
    }
  }
}
