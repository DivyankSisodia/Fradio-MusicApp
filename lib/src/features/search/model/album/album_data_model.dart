import 'album_model.dart';

class AlbumDataModel {
  final String albumId;
  final String name;
  final String label;
  final String totalTracks;
  final String popularity;
  final String imageUrl;
  final List<AlbumTrack> tracks;

  AlbumDataModel({
    required this.albumId,
    required this.name,
    required this.label,
    required this.totalTracks,
    required this.popularity,
    required this.imageUrl,
    required this.tracks,
  });

  factory AlbumDataModel.fromJson(Map<String, dynamic> json) {
    return AlbumDataModel(
      albumId: json['id'],
      name: json['name'],
      label: json['label'],
      totalTracks: json['total_tracks'].toString(),
      popularity: json['popularity'].toString(),
      imageUrl: (json['images'] as List).isNotEmpty 
          ? json['images'][0]['url']
          : '',
      tracks: (json['tracks']['items'] as List)
          .map((item) => AlbumTrack.fromJson(item))
          .toList(),
    );
  }
}


class AlbumTrack {
  final String trackId;
  final String name;
  final List<AlbumArtists> artists;

  AlbumTrack({
    required this.trackId,
    required this.name,
    required this.artists,
  });

  factory AlbumTrack.fromJson(Map<String, dynamic> json) {
    return AlbumTrack(
      trackId: json['id'],
      name: json['name'],
      artists: (json['artists'] as List)
          .map((item) => AlbumArtists.fromJson(item))
          .toList(),
    );
  }
}
