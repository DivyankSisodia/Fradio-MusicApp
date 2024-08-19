class CategoryPlaylistModel {
  final String id;
  final String description;
  final String images;

  CategoryPlaylistModel({
    required this.id,
    required this.description,
    required this.images,
  });

  factory CategoryPlaylistModel.fromJson(Map<String, dynamic> json) {
    return CategoryPlaylistModel(
      id: json['id'],
      description: json['description'],
      images: json['images'][0]['url'],
    );
  }
}
