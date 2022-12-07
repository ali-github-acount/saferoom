class Profile {
  final String? profileImageURL;
  final String? coverPhotoURL;
  final String? shortBiography;

  const Profile({
    required this.profileImageURL,
    required this.coverPhotoURL,
    required this.shortBiography,
  });

  const Profile.init({
    this.profileImageURL,
    this.coverPhotoURL,
    this.shortBiography,
  });

  Profile copyWith({
    String? profileImageURL,
    String? coverPhotoURL,
    String? shortBiography,
  }) {
    return Profile(
      profileImageURL: profileImageURL ?? this.profileImageURL,
      coverPhotoURL: coverPhotoURL ?? this.coverPhotoURL,
      shortBiography: shortBiography ?? this.shortBiography,
    );
  }

  Map<String, dynamic> toMap() {
    var json = <String, dynamic>{
      'profileImageURL': profileImageURL,
      'coverPhotoURL': coverPhotoURL,
      'shortBiography': shortBiography,
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }

  factory Profile.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const Profile.init();
    return Profile(
      profileImageURL: map['profileImageURL'],
      coverPhotoURL: map['coverPhotoURL'],
      shortBiography: map['shortBiography'],
    );
  }
}
