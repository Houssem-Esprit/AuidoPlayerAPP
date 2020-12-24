part of 'playlist_bloc.dart';



class PlayListState extends Equatable{

  PlayListState([List props = const[]]):super();
  @override
  List<Object> get props => [];


}

//**************  Data flows stats ****************//

class PlayList_AlbumTracks_Empty extends PlayListState{}

class PlayList_AlbumTracks_Loading extends PlayListState{}

class PlayList_AlbumTracks_Loaded extends PlayListState{

   PlayList_AlbumTracks_Loaded({@required this.tracks}):assert(tracks!=null);
   List<AlbumTracker> tracks;

   @override
   List<Object> get props => [tracks];
}

class PlayList_AlbumTracks_Error extends PlayListState{}

//**************  Data flows stats ****************//




// ****************** Audio State *******************//
/*

class PauseAudioPlayer extends PlayListState{
  void pauseAudio;
  PauseAudioPlayer({@required this.pauseAudio});

  @override
  List<Object> get props => [];
}


class ResumeAudioPlayer extends PlayListState{
  void resumeAudio;
  ResumeAudioPlayer({@required this.resumeAudio});

  @override
  List<Object> get props => [];
}


class OpenAndPlayAudioPlayer extends PlayListState{
   void openAudio;
  OpenAndPlayAudioPlayer({@required this.openAudio});

  @override
  List<Object> get props => [];
} */



