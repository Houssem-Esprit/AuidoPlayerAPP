

part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable{
  MusicEvent([List props = const []]):super();

  @override
  List<Object> get props => [];

}

class TrackTaped extends MusicEvent{
  final String url;
  final bool Playstate;
  final int index;
  TrackTaped({@required this.url, @required this.Playstate,this.index}):super([url,Playstate,index]);

  @override
  String toString() =>"";
}

class MusicButtonTaped extends MusicEvent{
}

class PauseButtonTaped extends MusicEvent{
}

class ResumeButtonTaped extends MusicEvent{
}

class DefaultPlayButton extends MusicEvent{}

class TrackDurationPositionAskedEvent extends MusicEvent{}