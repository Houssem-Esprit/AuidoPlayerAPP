import 'dart:convert';

import 'package:equatable/equatable.dart';

/*
class Album extends Equatable{

  const Album({
    this.idAlbum,
    this.nameAlbum
});

  final String idAlbum;
  final String nameAlbum;

  @override
  List<Object> get props => [idAlbum,nameAlbum];

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      idAlbum: json['_id'],
      nameAlbum: json['name']
    );
  }

}


class Tracks extends Equatable{

  const Tracks({
    this.album,
    this.idTrack,
    this.nameTrack,
    this.audio,
});

  final Album album;
  final String idTrack;
  final String nameTrack;
  final String audio;


  @override
  // TODO: implement props
  List<Object> get props => [album,idTrack,nameTrack,audio];

 factory Tracks.fromJson(Map<String,dynamic> json){
   return Tracks(
     album: Album.fromJson(json['album_id']),
     idTrack: json['_id'],
     nameTrack: json['name'],
     audio: json['audio']
   );
 }

}

 class AllAlbumTracks extends Equatable{

   AllAlbumTracks({this.tracks});
   final List<Tracks> tracks;
  @override
  // TODO: implement props
  List<Object> get props => [];

  factory AllAlbumTracks.fromJson(List<dynamic> json){
    List<Tracks> tracks = new List<Tracks>();
    tracks = json.map((e) => Tracks.fromJson(e)).toList();
    //Creates an instance of PlaceName and adds to the placeNames list.
    return new AllAlbumTracks(tracks: tracks);

  }
}*/

/*

class AlbumTrackers {
  String sId;
  String name;
  AlbumId albumId;
  String audio;
  String createdAt;
  String updatedAt;
  int iV;

  AlbumTrackers(
      {this.sId,
        this.name,
        this.albumId,
        this.audio,
        this.createdAt,
        this.updatedAt,
        this.iV});

  AlbumTrackers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    albumId = json['album_id'] != null
        ? new AlbumId.fromJson(json['album_id'])
        : null;
    audio = json['audio'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.albumId != null) {
      data['album_id'] = this.albumId.toJson();
    }
    data['audio'] = this.audio;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class AlbumId {
  String sId;
  String name;
  String createdAt;
  String updatedAt;
  int iV;

  AlbumId({this.sId, this.name, this.createdAt, this.updatedAt, this.iV});

  AlbumId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}


 */
// To parse this JSON data, do
//
//     final albumTracker = albumTrackerFromJson(jsonString);

import 'dart:convert';

List<AlbumTracker> albumTrackerFromJson(String str) => List<AlbumTracker>.from(json.decode(str).map((x) => AlbumTracker.fromJson(x)));

String albumTrackerToJson(List<AlbumTracker> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumTracker {
  AlbumTracker({
    this.id,
    this.name,
    this.albumId,
    this.audio,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  AlbumId albumId;
  String audio;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AlbumTracker.fromJson(Map<String, dynamic> json) => AlbumTracker(
    id: json["_id"],
    name: json["name"],
    albumId: AlbumId.fromJson(json["album_id"]),
    audio: json["audio"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "album_id": albumId.toJson(),
    "audio": audio,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class AlbumId {
  AlbumId({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Id id;
  Name name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AlbumId.fromJson(Map<String, dynamic> json) => AlbumId(
    id: idValues.map[json["_id"]],
    name: nameValues.map[json["name"]],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "name": nameValues.reverse[name],
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

enum Id { THE_5_FDB5185762_AA317_B4_C884_CA, THE_5_FDB51_DE762_AA317_B4_C884_CB }

final idValues = EnumValues({
  "5fdb5185762aa317b4c884ca": Id.THE_5_FDB5185762_AA317_B4_C884_CA,
  "5fdb51de762aa317b4c884cb": Id.THE_5_FDB51_DE762_AA317_B4_C884_CB
});

enum Name { GENERAL_ADMISSION, HOTEL_DIABLO }

final nameValues = EnumValues({
  "GENERAL ADMISSION": Name.GENERAL_ADMISSION,
  "HOTEL DIABLO": Name.HOTEL_DIABLO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
