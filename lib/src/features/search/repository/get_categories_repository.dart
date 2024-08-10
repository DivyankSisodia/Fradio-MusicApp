import 'dart:convert';

import 'package:fradio/src/config/api_keys/spotify/spotify_apis.dart';
import 'package:fradio/src/features/search/model/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetCategories {
  Future<List<CategoriesModel>> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String categoryUrl = SpotifyApis.categories;

    String token = prefs.getString('access_token')!;

    print('Token: $token'); // Debug print

    try {
      final response = await http.get(
        Uri.parse(categoryUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print('Categories Data: ${data['categories']['items']}');
        return (data['categories']['items'] as List)
            .map((item) => CategoriesModel.fromJson(item))
            .toList();
      } else {
        print('Failed to get categories: ${response.statusCode}');
        throw Exception('Failed to get categories');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to get categories: $error');
    }
  }
}
