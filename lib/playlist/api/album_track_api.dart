import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lecteurmultimedia/playlist/models/models.dart';
import 'package:meta/meta.dart';

class AlbumTrackApi{

  AlbumTrackApi({
    @required this.httpClient
  }):assert(httpClient!=null);

  final _baseUrl ='http://localhost:3000/';
  final http.Client httpClient ;

  // async get request using Future
  Future <List<AlbumTracker>> getAlbumTracks() async {
    final response = await httpClient.get(_baseUrl+"tracks/");
    if(response.statusCode==200){
      print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        //Map data = jsonResponse;
       // AllAlbumTracks allAlbumTracks =new AllAlbumTracks.fromJson(data);
        //List<Tracks> tracks = (json.decode(jsonResponse)as List).map((e) => Tracks.fromJson(e)).toList();
       // AlbumTrackers tracks =  AlbumTrackers.fromJson(m);
       // print("TRACKERSSSS : $tracks");
        //allAlbumTracks.tracks.forEach((element) => print(element.audio));
        final List<AlbumTracker> tracks = albumTrackerFromJson(response.body);

        return tracks;
    }
  }

}