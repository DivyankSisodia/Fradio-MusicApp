// home_data.dart
import '../model/popular_albums_model.dart';
import '../model/popular_artists_model.dart';
import '../model/popular_radio_model.dart';

class HomeData {
  final List<PopularArtistsModel> popularArtists;
  final List<PopularAlbumModel> popularAlbums;
  final List<PopularRadioModel> popularRadios;

  HomeData({
    required this.popularArtists,
    required this.popularAlbums,
    required this.popularRadios,
  });
}