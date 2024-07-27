import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/popular_albums_model.dart';
import '../model/popular_artists_model.dart';
import '../model/popular_radio_model.dart';
import 'home_data.dart';

class HomeRepository {
  String baseUrl = dotenv.env['url_host_scrapper'] ?? '';
  final String boxName = 'homeData';

  Future<HomeData> fetchHomeData() async {
    var box = await Hive.openBox(boxName);

    if (box.containsKey('homeData')) {
      print('Fetching home data from cache');
      return _getHomeDataFromHive(box);
    } else {
      print('Fetching home data from network');
      return await _fetchAndCacheHomeData(box);
    }
  }

  HomeData _getHomeDataFromHive(Box box) {
    final data = box.get('homeData');
    return HomeData(
      popularArtists: (data['popularArtists'] as List).cast<PopularArtistsModel>(),
      popularAlbums: (data['popularAlbums'] as List).cast<PopularAlbumModel>(),
      popularRadios: (data['popularRadios'] as List).cast<PopularRadioModel>(),
    );
  }

  Future<HomeData> _fetchAndCacheHomeData(Box box) async {
    String endpoint = 'https://$baseUrl/v1/home?region=IN';

    final response = await http.get(Uri.parse(endpoint), headers: {
      'x-rapidapi-key': '37d6897f52mshd3042240220926ap1e6034jsn66512525e96d',
      'x-rapidapi-host': 'spotify-scraper.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      final List<dynamic> sections = responseJson['sections']['items'];
      print(sections);
      
      List<PopularArtistsModel> popularArtists = [];
      List<PopularAlbumModel> popularAlbums = [];
      List<PopularRadioModel> popularRadios = [];

      for (var section in sections) {
        if (section['type'] == 'section') {
          switch (section['title']) {
            case 'Popular artists':
              popularArtists = _parseItems<PopularArtistsModel>(section['contents']['items'], (item) => PopularArtistsModel.fromJson(item));
              break;
            case 'Popular albums':
              popularAlbums = _parseItems<PopularAlbumModel>(section['contents']['items'], (item) => PopularAlbumModel.fromJson(item));
              break;
            case 'Popular radio':
              popularRadios = _parseItems<PopularRadioModel>(section['contents']['items'], (item) => PopularRadioModel.fromJson(item));
              break;
          }
        }
      }

      final homeData = HomeData(
        popularArtists: popularArtists,
        popularAlbums: popularAlbums,
        popularRadios: popularRadios,
      );

      // Cache the home data
      await box.put('homeData', {
        'popularArtists': popularArtists,
        'popularAlbums': popularAlbums,
        'popularRadios': popularRadios,
      });

      return homeData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<T> _parseItems<T>(List<dynamic> items, T Function(Map<String, dynamic>) fromJson) {
    return items
        .where((item) => item['type'] == _getTypeForModel<T>())
        .map((item) => fromJson(item))
        .toList();
  }

  String _getTypeForModel<T>() {
    switch (T) {
      case PopularArtistsModel:
        return 'artist';
      case PopularAlbumModel:
        return 'album';
      case PopularRadioModel:
        return 'playlist';
      default:
        throw Exception('Unknown model type');
    }
  }
  Future<void> clearHomeData() async {
    var box = await Hive.openBox(boxName);
    await box.clear();
    if(box.isEmpty){
      print('Home data cleared');
    }
  }
}