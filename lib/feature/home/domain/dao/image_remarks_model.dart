import 'dart:convert';

/// id : 4
/// latitude : "27.7106066"
/// longitude : "85.3196744"
/// remarks : "test"
/// images : ["abc","abc",null]

ImageRemarksModel imageRemarksModelFromJson(String str) =>
    ImageRemarksModel.fromJson(json.decode(str));
String imageRemarksModelToJson(ImageRemarksModel data) =>
    json.encode(data.toJson());

class ImageRemarksModel {
  ImageRemarksModel({
    int? id,
    String? latitude,
    String? longitude,
    String? remarks,
    List<String>? images,
    String? currentLocation,
    String? createdAt,
  }) {
    _id = id;
    _latitude = latitude;
    _longitude = longitude;
    _remarks = remarks;
    _images = images;
    _currentLocation = currentLocation;
    _createdAt = createdAt;
  }

  ImageRemarksModel.fromJson(dynamic json) {
    _id = json['id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _remarks = json['remarks'];
    _images =
        json['images'] != null ? json['images'].cast<String>() : <String>[];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _latitude;
  String? _longitude;
  String? _remarks;
  List<String>? _images;
  String? _currentLocation;
  String? _createdAt;
  ImageRemarksModel copyWith({
    int? id,
    String? latitude,
    String? longitude,
    String? remarks,
    List<String>? images,
    String? currentLocation,
    String? createdAt,
  }) =>
      ImageRemarksModel(
        id: id ?? _id,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        remarks: remarks ?? _remarks,
        images: images ?? _images,
        currentLocation: currentLocation ?? _currentLocation,
        createdAt: createdAt ?? _createdAt,
      );
  int? get id => _id;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get remarks => _remarks;
  List<String>? get images => _images;

  String? get currentLocation => _currentLocation;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = _id;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['remarks'] = _remarks;
    map['images'] = _images;
    return map;
  }
}
