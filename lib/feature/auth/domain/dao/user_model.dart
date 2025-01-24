import 'dart:convert';

/// id : 1
/// name : "System Admin"
/// username : "system.admin"
/// email : "admin@sociair.com"
/// created_at : "2024-08-07T10:22:55.000000Z"
/// updated_at : "2024-08-07T10:22:55.000000Z"

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    num? id,
    String? name,
    String? username,
    String? email,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _username;
  String? _email;
  String? _createdAt;
  String? _updatedAt;
  UserModel copyWith({
    num? id,
    String? name,
    String? username,
    String? email,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserModel(
        id: id ?? _id,
        name: name ?? _name,
        username: username ?? _username,
        email: email ?? _email,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
