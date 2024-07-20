import 'package:hive/hive.dart';

part 'popular_radio_model.g.dart';

@HiveType(typeId: 2)
class PopularRadioModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String images;

  PopularRadioModel({
    required this.name,
    required this.id,
    required this.description,
    required this.images,
  });

  factory PopularRadioModel.fromJson(Map<String, dynamic> json) {
    return PopularRadioModel(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      images: json['images'][0][0]['url'],
    );
  }
}
