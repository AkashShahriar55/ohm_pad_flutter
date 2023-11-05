import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/base/controller.dart';

enum PlayerState { playing, paused }

class OhmPlayerController extends Controller {
  final ValueNotifier<double> playerProgress = ValueNotifier<double>(50.0);
  final ValueNotifier<PlayerState> playerState = ValueNotifier<PlayerState>(
    PlayerState.paused,
  );

  void playPause() async {
    if (playerState.value == PlayerState.paused) {
      //play the music
      playerState.value = PlayerState.playing;
    } else {
      //pause the music
      playerState.value = PlayerState.paused;
    }
  }

  void forward() async {}

  void backward() async {}

  @override
  void disposeController() {
    playerProgress.dispose();
    playerState.dispose();
    super.disposeController();
  }
}
