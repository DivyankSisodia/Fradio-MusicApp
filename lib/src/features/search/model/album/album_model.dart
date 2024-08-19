class AlbumModel {
  final List<AlbumArtists> artists;
  final String id;
  final String imageUrl;
  final String name;

  AlbumModel({
    required this.artists,
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      artists: (json['artists'] as List)
          .map((item) => AlbumArtists.fromJson(item))
          .toList(),
      id: json['id'],
      imageUrl: json['images'][0]['url'],
      name: json['name'],
    );
  }
}

class AlbumArtists {
  final String artistsId;
  final String name;

  AlbumArtists({required this.name, required this.artistsId});

  factory AlbumArtists.fromJson(Map<String, dynamic> json) {
    return AlbumArtists(
      artistsId: json['id'],
      name: json['name'],
    );
  }
}
