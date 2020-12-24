

part of 'music_bloc.dart';


abstract class MusicState extends Equatable{

  MusicState([List props = const[]]):super();
  @override
  List<Object> get props => [];


}


// ****************** Audio State *******************//

class InitialState extends MusicState{

}

class PauseAudioPlayer extends MusicState{
  Future pauseAudio;
  PauseAudioPlayer({@required this.pauseAudio});

  @override
  List<Object> get props => [];
}


class ResumeAudioPlayer extends MusicState{
  Future resumeAudio;
  ResumeAudioPlayer({@required this.resumeAudio});

  @override
  List<Object> get props => [];
}


class OpenAndPlayAudioPlayer extends MusicState{
  void TrackPosition;
  OpenAndPlayAudioPlayer({@required this.TrackPosition});

  @override
  List<Object> get props => [];
}

class TrackPositionState extends MusicState{
  AssetsAudioPlayer assetsAudioPlayer;
  TrackPositionState({@required this.assetsAudioPlayer});

  @override
  List<Object> get props => [];
}

class DefaultAudioPlayerState extends MusicState{}
