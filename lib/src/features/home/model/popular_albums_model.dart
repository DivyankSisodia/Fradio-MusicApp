import 'package:hive/hive.dart';

part 'popular_albums_model.g.dart';

@HiveType(typeId: 0)
class PopularAlbumModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String artistId;
  @HiveField(3)
  final String artists;
  @HiveField(4)
  final String cover;

  PopularAlbumModel({
    required this.id,
    required this.name,
    required this.artistId,
    required this.artists,
    required this.cover,
  });

  factory PopularAlbumModel.fromJson(Map<String, dynamic> json) {
    return PopularAlbumModel(
      id: json['id'],
      name: json['name'],
      artistId: json['artists'][0]['id'],
      artists: json['artists'][0]['name'],
      cover: json['cover'][1]['url'],
    );
  }
}
