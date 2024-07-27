class CategoriesModel {
  final String id;
  final String icon;
  final String name;

  CategoriesModel({
    required this.id,
    required this.icon,
    required this.name,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      icon: json['icons'][0]['url'],
      name: json['name'],
    );
  }
}
