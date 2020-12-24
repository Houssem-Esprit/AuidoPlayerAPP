
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecteurmultimedia/playlist/bloc/dataBloc/playlist_bloc.dart';
import 'package:lecteurmultimedia/playlist/bloc/music_bloc/music_bloc.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class PlayListForm extends StatelessWidget {
  MusicBloc musicBloc;
  PlayListBloc playListBloc;
  int index;

  @override
  Widget build(BuildContext context) {
    playListBloc = BlocProvider.of<PlayListBloc>(context);
    musicBloc = BlocProvider.of<MusicBloc>(context);
    index = 0;

    return BlocBuilder<PlayListBloc,PlayListState>(
      builder: (context,state){

        if(state is PlayList_AlbumTracks_Empty){
          BlocProvider.of<PlayListBloc>(context).add(FetchAlbumTracks());
          //musicBloc.add(DefaultPlayButton());
        }

        if(state is PlayList_AlbumTracks_Error){
          //BlocProvider.of<PlayListBloc>(context).add(FetchAlbumTracks());
          return Center(
            child: Text('failed to fetch data'),
          );
        }

        return state is PlayList_AlbumTracks_Loaded ?


        Container(
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Center(
                    child: Container(
                      child: Image(image: AssetImage("assets/images/icon_app.png"),),
                    ),
                  )
              ),

              Expanded(
                  flex: 4,
                  child:ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.tracks.length,

                      itemBuilder: (context, int index){

                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                                  Row(
                                    children: [
                                      Text("${index}.",
                                        style: TextStyle(
                                          fontFamily: "SFProDisplay/FontsFree-Net-SFProDisplay-Light.ttf",
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 6.0,),
                                      GestureDetector(
                                        onTap: (){
                                          this.index = index;
                                          print("INDEX WHEN TAPE : ${this.index}");
                                          musicBloc.add(TrackTaped(url:"http:localhost:3000/public/audios/"+state.tracks[index].audio,index: index));
                                          //musicBloc.setAudioState(true);
                                          musicBloc.add(ResumeButtonTaped());
                                          musicBloc.add(TrackDurationPositionAskedEvent());

                                        },
                                        child: Text("${state.tracks[index].name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "SFProDisplay/FontsFree-Net-SFProDisplay-Light.ttf",
                                            fontSize: this.index == index?16.0:14.0,
                                            color: this.index==index?Colors.blue[200]:Colors.white,
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                              Row(
                                    children: [
                                      Text("01:50",
                                        style: TextStyle(
                                          fontFamily: "SFProDisplay/FontsFree-Net-SFProDisplay-Light.ttf",
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(icon: new Image.asset("assets/icons/hurt_icon.png"), onPressed: (){
                                      }),
                                      IconButton(icon: Icon(Icons.more_vert,color: Colors.white,), onPressed: (){
                                      }),
                                    ],
                                  ),


                            ],
                          ) ,
                        );
                      }
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3.0,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: double.infinity,
                      color: Colors.indigo[900],
                      child: Row(
                        children: [
                          BlocBuilder<MusicBloc,MusicState>(
                            builder: ( context, MusicState audioState){
                              if(audioState is PauseAudioPlayer){
                                print("PlayListForm : PAUSEAUDIOPLAYER STATE");

                                return Expanded(
                                    flex: 1,

                                    child: Container(
                                      color: Colors.green,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: (){
                                            bool state = musicBloc.audioState;
                                            musicBloc.setAudioState(state);
                                          },
                                          icon:Icon( Icons.play_arrow,color: Colors.blue[900],)
                                          ,)
                                        ,),
                                    )
                                );

                              } if(audioState is ResumeAudioPlayer){
                                print("PlayListForm : RESUMEAUDIOPLAYER STATE");
                                return Expanded(
                                    flex: 1,

                                    child: Container(
                                      color: Colors.green,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: (){
                                            bool state = musicBloc.audioState;
                                            musicBloc.setAudioState(state);
                                          },
                                          icon:Icon( Icons.pause,color: Colors.blue[900],)
                                          ,)
                                        ,),
                                    )
                                );
                              }

                              return Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.green[100],
                                    child: Center(
                                      child: IconButton(
                                        onPressed: (){
                                          bool state = musicBloc.audioState;
                                          musicBloc.setAudioState(state);
                                        },
                                        icon:Icon( Icons.play_arrow,color: Colors.blue[900],)
                                        ,)
                                      ,),
                                  )
                              );


                            },
                          ),

                          Expanded(
                              flex:3 ,
                              child: Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text("${state.tracks[musicBloc.currentIndex].albumId.name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "SFProDisplay/FontsFree-Net-SFProDisplay-Light.ttf",
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),),
                                      ),
                                      SizedBox(
                                        height: 3.0,
                                      ),
                                      Expanded(
                                        child: Text("${state.tracks[musicBloc.currentIndex].name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "SFProDisplay/FontsFree-Net-SFProDisplay-Light.ttf",
                                            fontSize: 14.0,
                                            color: Colors.white60,
                                          ),),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  IconButton(icon: new Image.asset("assets/icons/hurt_icon.png"), onPressed: (){
                                  }),
                                  IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: (){
                                  }),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),

        ): Center(child: CircularProgressIndicator(),);
      },


    );

  }
}


String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
  twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds =
  twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}