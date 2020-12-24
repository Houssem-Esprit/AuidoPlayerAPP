


import 'package:lecteurmultimedia/playlist/api/album_track_api.dart';
import 'package:lecteurmultimedia/playlist/models/album_tracks.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AlbumTrackRepository{

  const AlbumTrackRepository({
    this.api,
    this.assetsAudioPlayer
}):assert(api!=null && assetsAudioPlayer !=null);

  final AlbumTrackApi api;
  final AssetsAudioPlayer assetsAudioPlayer;

  Future <List<AlbumTracker>> getAlbumTracks() async {
    print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
    return await api.getAlbumTracks() ;
  }





  // Audio Operation

Future OpenMyAudio(url) async{

    try{
  if(assetsAudioPlayer.isPlaying.value == true){
    await assetsAudioPlayer.stop();
  }
  await assetsAudioPlayer.open(Audio.network("$url"));
  await assetsAudioPlayer.play();


  }catch (t){

  }

}


Future<AssetsAudioPlayer> getDurationPosition() async{
  return this.assetsAudioPlayer;
}

Future PauseAudio()async{
  try{
    await assetsAudioPlayer.pause();
  }catch (t){

  }
}


  Future ResumeAudio()async{
    try{
      await assetsAudioPlayer.play();
    }catch (t){

    }
  }


  Future StopAudio()async{
    try{
      await assetsAudioPlayer.stop();
    }catch (t){

    }
  }


}