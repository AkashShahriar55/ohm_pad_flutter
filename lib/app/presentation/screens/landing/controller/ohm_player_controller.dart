import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/base/controller.dart';
import 'package:ohm_pad_flutter/app/core/utils/log.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/song_meta_data.dart';

enum OhmPlayerState { playing, paused }

class OhmPlayerController extends Controller {
  final ValueNotifier<double> playerProgress = ValueNotifier<double>(0.0);
  final ValueNotifier<OhmPlayerState> playerState =
      ValueNotifier<OhmPlayerState>(
    OhmPlayerState.paused,
  );

  final ValueNotifier<SongMetaData?> currentSong =
      ValueNotifier<SongMetaData?>(null);

  final AudioPlayer player = AudioPlayer();
  late final StreamSubscription<Duration> durationListener;
  late final StreamSubscription<Duration> positionListener;

  @override
  void onInit() {
    _initializeListeners();
    super.onInit();
  }

  void _initializeListeners() {
    durationListener = player.onDurationChanged.listen(_onDurationChanged);
    positionListener = player.onPositionChanged.listen(_onPositionChanged);
    player.onPlayerComplete.listen(_onComplete);
    // player.onPlayerStateChanged.listen(onPlayerStateChange);
  }

  void _onComplete(void event) async {
    Log.debug("complete_debug:");
    _stopPlayer();
  }

  void _onDurationChanged(Duration d) {
    // this is the duration of the music
    Log.debug("duration_debug: $d");
    currentSong.value = currentSong.value?.copyWith(
      duration: d,
    );
  }

  void _onPositionChanged(Duration p) {
    // this is the playing position of the music
    Log.debug("position_debug: $p");
    currentSong.value = currentSong.value?.copyWith(
      seekDuration: p,
    );

    playerProgress.value = _calculateProgress(
      currentSong.value?.duration ?? const Duration(),
      p,
    );
  }

  void onPlayerStateChange(PlayerState s) {
    // this is the player state Pause, Stopped, Playing
  }

  void _removeListeners() {
    durationListener.cancel();
    positionListener.cancel();
  }

  void playPause() async {
    if (playerState.value == OhmPlayerState.paused) {
      //play the music
      _resumePlayer();
    } else {
      //pause the music
      pausePlayer();
    }
  }

  void pausePlayer() async {
    if (player.state == PlayerState.playing) {
      await player.pause();
      playerState.value = OhmPlayerState.paused;
    }
  }

  void _resumePlayer() async {
    await player.resume();
    playerState.value = OhmPlayerState.playing;
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

  void setSongMetaData(SongModel model) async {
    _updateSongMetaData(model);
    _setSource();
  }

  void setAndPlay(SongModel model) {
    _stopPlayer();
    _updateSongMetaData(model);
    _play();
  }

  void seek(double progress) {
    Duration seekDuration = _calculateSeekDuration(
      currentSong.value?.duration ?? const Duration(),
      progress,
    );
    player.seek(seekDuration);
    _resumePlayer();
  }

  void _updateSongMetaData(SongModel model) {
    currentSong.value = SongMetaData(
      songName: model.songName,
      duration: const Duration(),
      seekDuration: const Duration(),
      songAssetPath: model.songAssetPath,
    );
  }

  void _setSource() async {
    if (currentSong.value != null) {
      await player.setSource(AssetSource(currentSong.value!.songAssetPath));
    }
  }

  void _play() async {
    if (currentSong.value != null) {
      await player.play(AssetSource(currentSong.value!.songAssetPath));
      playerState.value = OhmPlayerState.playing;
    }
  }

  void _stopPlayer() async {
    pausePlayer();
    await player.stop();
    // await player.release();
    playerProgress.value = 0.0;
  }

  double _calculateProgress(Duration original, Duration progress) {
    // Convert the durations to milliseconds to perform the calculation.
    double originalMs = original.inMilliseconds.toDouble();
    double progressMs = progress.inMilliseconds.toDouble();

    // Calculate the progress as a percentage.
    if (originalMs > 0) {
      return (progressMs / originalMs) * 100;
    } else {
      return 0.0; // To avoid division by zero when original duration is zero.
    }
  }

  Duration _calculateSeekDuration(
      Duration originalDuration, double progressPercentage) {
    if (progressPercentage < 1) {
      progressPercentage = 1;
    } else if (progressPercentage > 100) {
      progressPercentage = 100;
    }

    double originalMs = originalDuration.inMilliseconds.toDouble();
    double seekMs = (originalMs * progressPercentage) / 100;

    return Duration(milliseconds: seekMs.round());
  }
}
