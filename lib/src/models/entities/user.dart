import 'package:saferoom/src/models/entities/profile.dart';

class SRUser {
  final String? uid;
  final String? name;
  final String? lastname;
  final String? phoneNumber;
  final Profile profile;
  final String? email;
  final String? logPassword;

  const SRUser({
    required this.uid,
    required this.name,
    required this.lastname,
    required this.phoneNumber,
    required this.profile,
    required this.email,
    required this.logPassword,
  });
  const SRUser.init({
    this.uid,
    this.name,
    this.lastname,
    this.phoneNumber,
    this.profile = const Profile.init(),
    this.email,
    this.logPassword,
  });

  SRUser copyWith({
    String? uid,
    String? name,
    String? lastname,
    String? phoneNumber,
    Profile? profile,
    String? email,
    String? logPassword,
  }) {
    return SRUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profile: profile ?? this.profile,
      email: email ?? this.email,
      logPassword: logPassword ?? this.logPassword,
    );
  }

  Map<String, dynamic> toMap() {
    var json = <String, dynamic>{
      'uid': uid,
      'name': name,
      'lastname': lastname,
      'phoneNumber': phoneNumber,
      'profile': profile,
      'email': email,
      'logPassword': logPassword,
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }

  factory SRUser.fromMap(Map<String, dynamic>? map) {
    if (map == null) return const SRUser.init();
    return SRUser(
      uid: map['uid'],
      name: map['name'],
      lastname: map['lastname'],
      phoneNumber: map['phoneNumber'],
      profile: map['profile'],
      email: map['email'],
      logPassword: map['logPassword'],
    );
  }

  static List<SRUser> listFromMap(List? list) {
    if (list == null || list.isEmpty) return const [];
    return list.map((e) => SRUser.fromMap(e)).toList();
  }
}
