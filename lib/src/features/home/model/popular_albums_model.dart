class PopularAlbumModel {
  final String id;
  final String name;
  final List<Artists> artists;
  final List<Cover> cover;

  PopularAlbumModel({
    required this.id,
    required this.name,
    required this.artists,
    required this.cover,
  });

  factory PopularAlbumModel.fromJson(Map<String, dynamic> json) {
    var artistsList = json['artists'] as List;
    List<Artists> artists = artistsList.map((i) => Artists.fromJson(i)).toList();

    var coverList = json['cover'] as List;
    List<Cover> cover = coverList.map((i) => Cover.fromJson(i)).toList();

    return PopularAlbumModel(
      id: json['id'],
      name: json['name'],
      artists: artists,
      cover: cover,
    );
  }
}

class Artists {
  final String id;
  final String name;

  Artists({
    required this.id,
    required this.name,
  });

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Cover {
  final String url;

  Cover({
    required this.url,
  });

  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      url: json['url'],
    );
  }
}
