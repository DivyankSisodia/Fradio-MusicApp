import 'package:hive/hive.dart';

part 'popular_artists_model.g.dart';

@HiveType(typeId: 1)
class PopularArtistsModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String visuals;

  PopularArtistsModel({
    required this.id,
    required this.name,
    required this.visuals,
  });

  factory PopularArtistsModel.fromJson(Map<String, dynamic> json) {
    return PopularArtistsModel(
      id: json['id'],
      name: json['name'],
      visuals: json['visuals']['avatar'][1]['url'],
    );
  }
}
