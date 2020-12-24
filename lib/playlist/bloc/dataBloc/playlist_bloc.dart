
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lecteurmultimedia/playlist/models/album_tracks.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecteurmultimedia/repository/album_tracks_repository.dart';


part 'playlist_event.dart';
part 'playlist_state.dart';


class PlayListBloc extends Bloc<PlayListEvent,PlayListState>{
  PlayListBloc({@required this.albumTrackRepository})
      :assert(albumTrackRepository != null)
      , super(PlayList_AlbumTracks_Empty());



  final AlbumTrackRepository albumTrackRepository;



  @override
  PlayListState get  initialState => PlayList_AlbumTracks_Empty();

  @override
  Stream<PlayListState> mapEventToState(PlayListEvent event) async*{

    /*   if(event is AppStarted){
            //this.add(MusicButtonTaped(Playstate: this.audioState));
            this.add(TrackTaped(url: this.audioUrl,Playstate: this.audioState,index: this.currentIndex));
        } */

      /*  if(event is MusicButtonTaped){
          if(currentState is PauseAudioPlayer){
            print("IM IN PauseAudioPlayer");
            yield ResumeAudioPlayer(resumeAudio: await albumTrackRepository.ResumeAudio() );
          }else if (currentState is ResumeAudioPlayer){

          }
        }  */


        if(event is FetchAlbumTracks){
          yield PlayList_AlbumTracks_Loading();
          try{
            yield PlayList_AlbumTracks_Loaded(tracks: await albumTrackRepository.getAlbumTracks());
          }catch(_){
            yield PlayList_AlbumTracks_Error();
          }
        }
  }



}
