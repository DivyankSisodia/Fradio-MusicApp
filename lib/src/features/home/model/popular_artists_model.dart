class PopularArtistsModel {
  final String id;
  final String name;
  final Visuals visuals;

  PopularArtistsModel({
    required this.id,
    required this.name,
    required this.visuals,
  });

  factory PopularArtistsModel.fromJson(Map<String, dynamic> json) {
    return PopularArtistsModel(
      id: json['id'],
      name: json['name'],
      visuals: Visuals.fromJson(json['visuals']),
    );
  }
}

class Visuals {
  final Avatar avatar;

  Visuals({required this.avatar});

  factory Visuals.fromJson(Map<String, dynamic> json) {
    var avatarList = json['avatar'] as List;
    Avatar firstAvatar = Avatar.fromJson(avatarList[0]);

    return Visuals(
      avatar: firstAvatar,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar.toJson(),
    };
  }
}

class Avatar {
  final String url;

  Avatar({
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}