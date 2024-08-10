class PlayListTrackModel {
  final String trackId;
  final String trackName;
  final String releaseDate;
  final Album album;
  final num popularity;

  PlayListTrackModel({
    required this.trackId,
    required this.trackName,
    required this.releaseDate,
    required this.album,
    required this.popularity,
  });

  factory PlayListTrackModel.fromJson(Map<String, dynamic> json) {
    return PlayListTrackModel(
      trackId: json['id'],
      trackName: json['name'],
      releaseDate: json['album']['release_date'],
      album: Album.fromJson(json['album']),
      popularity: json['popularity'],
    );
  }
}

class Album {
  final String albumId;
  final String albumName;
  final String albumImage;
  final String albumReleaseDate;
  final List<Artist> artists;

  Album({
    required this.albumId,
    required this.albumName,
    required this.albumImage,
    required this.albumReleaseDate,
    required this.artists,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumId: json['id'],
      albumName: json['name'],
      albumImage: json['images'][1]['url'],
      albumReleaseDate: json['release_date'],
      artists: (json['artists'] as List)
          .map((artist) => Artist.fromJson(artist))
          .toList(),
    );
  }
}

class Artist {
  final String artistId;
  final String artistName;

  Artist({
    required this.artistId,
    required this.artistName,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      artistId: json['id'],
      artistName: json['name'],
    );
  }
}
