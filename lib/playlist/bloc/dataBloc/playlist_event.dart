part of 'playlist_bloc.dart';

abstract class PlayListEvent extends Equatable{
// @Notes for the project examiner (Neopolis-dev)
// Define the events that a user can fire while interacting with the app in our case lunch media player and it's controls
// from these event we will produce a stats with the support of bloc (BLoC architecture pattern)
// we no longer need setState to manage the app state => which gives as more flexibility while building a big scale app
// it separate the business logic from UI (presentation layer) that allow as to more cover the code testability and
// decrease the fort couplet code
// the BLoC pattern was built by googler's hands
// @Houssem_Rekhaies

  PlayListEvent([List props = const []]):super();

  @override
  List<Object> get props => [];
}


class AppStarted extends PlayListEvent{
  String toString() =>'AppStarted';
}



class FetchAlbumTracks extends PlayListEvent{
    FetchAlbumTracks();
}