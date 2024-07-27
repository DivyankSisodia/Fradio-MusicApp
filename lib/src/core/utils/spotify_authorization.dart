import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/api_keys/spotify/spotify_apis.dart';

Future<String> getAccessToken(String clientId, String clientSecret) async {
  String authUrl = SpotifyApis.token;
  final String credentials = '$clientId:$clientSecret';
  final String encodedCredentials = base64Encode(utf8.encode(credentials));

  final response = await http.post(
    Uri.parse(authUrl),
    headers: {
      'Authorization': 'Basic $encodedCredentials',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {'grant_type': 'client_credentials'},
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data['access_token']);
    final String? accessToken = data['access_token'];

    // Save the access token to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken!);
    
    return data['access_token'];
  } else {
    throw Exception('Failed to get access token');
  }
}