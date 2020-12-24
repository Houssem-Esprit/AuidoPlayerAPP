
import 'package:flutter/material.dart';
import 'package:lecteurmultimedia/playlist/api/album_track_api.dart';
import 'package:lecteurmultimedia/playlist/bloc/music_bloc/music.dart';
import 'file:///C:/Users/HP/Desktop/2020/5th_Class_Esprit/Commercial_dev/Flutter_Test_Neopolis/client/lecteurmultimedia/lib/playlist/bloc/dataBloc/playlist_bloc.dart';
import 'package:lecteurmultimedia/playlist/view/playlist_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecteurmultimedia/repository/album_tracks_repository.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PlayListPage extends StatelessWidget {

  final AlbumTrackRepository albumTrackRepository = AlbumTrackRepository(api: AlbumTrackApi(httpClient: http.Client()), assetsAudioPlayer: AssetsAudioPlayer());

  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
         providers: [
           BlocProvider<PlayListBloc>(
             create: (context){
               return PlayListBloc(albumTrackRepository: albumTrackRepository);
             },
           ),
           BlocProvider<MusicBloc>(
             create: (context){
               return MusicBloc(albumTrackRepository: albumTrackRepository);
             },
           )
         ],
        child: PlayListForm(),
      );
  }
}









