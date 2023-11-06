import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/base/controller.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

enum PlayerState { playing, paused }

class OhmPlayerController extends Controller {
  final ValueNotifier<double> playerProgress = ValueNotifier<double>(50.0);
  final ValueNotifier<PlayerState> playerState = ValueNotifier<PlayerState>(
    PlayerState.paused,
  );

  final ValueNotifier<SongModel?> currentSong = ValueNotifier<SongModel?>(null);


  
  
  @override
  void onInit() {
    // TODO: implement onInit
    _initializeListeners();
    super.onInit();
  }
  
  
  void _initializeListeners(){
    currentSong.addListener(onCurrentSongChange);
    player.onDurationChanged.listen(onDurationChanged);
  }

  void onDurationChanged(Duration d){
      
  }

  void _removeListeners(){
    currentSong.addListener(onCurrentSongChange);
  }
  
  
  void onCurrentSongChange() async{
    if(currentSong.value != null){
      await player.setSource(AssetSource(currentSong.value!.songAssetPath));
    }
  }


  final player = AudioPlayer();

  void playPause() async {
    if (playerState.value == PlayerState.paused) {
      //play the music
      await player.resume();
      playerState.value = PlayerState.playing;
    } else {
      //pause the music
      await player.pause();
      playerState.value = PlayerState.paused;
    }
  }

  void forward() async {}

  void backward() async {}

  @override
  void disposeController() {
    playerProgress.dispose();
    playerState.dispose();
    _removeListeners();
    player.dispose();
    super.disposeController();
  }

  void setSong(SongModel model) {
    _stopPlayer();
    currentSong.value = model;

  }

  void _stopPlayer() async{
    await player.stop();
  }
}
