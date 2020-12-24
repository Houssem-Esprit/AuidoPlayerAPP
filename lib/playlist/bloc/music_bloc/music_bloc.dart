
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lecteurmultimedia/playlist/models/album_tracks.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecteurmultimedia/repository/album_tracks_repository.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

part 'music_state.dart';
part 'music_event.dart';


class MusicBloc extends Bloc<MusicEvent,MusicState>{
  MusicBloc({@required this.albumTrackRepository})
      : assert(albumTrackRepository!=null), super(InitialState());


  int currentIndex;
  String audioUrl ="";
  bool audioState=true;
  final AlbumTrackRepository albumTrackRepository;

  @override
  MusicState get  initialState => InitialState();

  @override
  Stream<MusicState> mapEventToState(MusicEvent event) async* {

     if(event is DefaultPlayButton){
       yield DefaultAudioPlayerState();
     }
     if(event is PauseButtonTaped){
    print("IM IN PauseAudioPlayer");
    yield PauseAudioPlayer(pauseAudio:await albumTrackRepository.PauseAudio());
    }

     if(event is ResumeButtonTaped) {
    print("IM IN ResumeAudioPlayer");
    yield ResumeAudioPlayer(resumeAudio: await albumTrackRepository.ResumeAudio() );
    }

    if(event is TrackDurationPositionAskedEvent){
      yield TrackPositionState(assetsAudioPlayer: await albumTrackRepository.getDurationPosition());
    }

     if(event is TrackTaped){
    try{
    this.audioUrl = event.url;
    //this.audioState = event.Playstate;
    this.currentIndex = event.index;
    yield OpenAndPlayAudioPlayer(TrackPosition: await albumTrackRepository.OpenMyAudio(this.audioUrl));
    //await albumTrackRepository.OpenMyAudio(this.audioUrl);
    }catch(_){}
    }
  }

  void setAudioState(bool state){
    if(state == true){
      this.add(ResumeButtonTaped());
      print("SetAudioState methode Lanched with TRUE");
      this.audioState=false;
    }
    else if(state == false){
      this.add(PauseButtonTaped());
      print("SetAudioState methode Lanched with FALSE");
       this.audioState=true;
    }
  }


}
