class PopularRadioModel {
  final String name;
  final String id;
  final String description;
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
