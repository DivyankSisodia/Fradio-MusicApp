import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeRepository {
  String baseUrl = dotenv.env['url_host_scrapper'] ?? '';

  Future<Map<String, dynamic>> fetchHomeData() async {
    String endpoint = 'https://$baseUrl/v1/home?region=IN';

    final response = await http.get(Uri.parse(endpoint), headers: {
      'x-rapidapi-key': '37d6897f52mshd3042240220926ap1e6034jsn66512525e96d',
      'x-rapidapi-host': 'spotify-scraper.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      print(responseJson);
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
