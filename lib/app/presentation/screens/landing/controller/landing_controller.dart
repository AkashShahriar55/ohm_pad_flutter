import 'package:flutter/cupertino.dart';
import 'package:ohm_pad_flutter/app/core/base/base_controller.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/data/repositor_impl/song_repository_impl.dart';
import 'package:ohm_pad_flutter/app/domain/repository/song_repository.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_bluetooth_controller.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_player_controller.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/song_ui_model.dart';

class LandingController extends BaseController {
  late final OhmPlayerController ohmPlayerController;
  late final OhmBluetoothController ohmBluetoothController;
  late final SongRepository _songRepository;

  final ValueNotifier<List<SongUiModel>> songList =
      ValueNotifier<List<SongUiModel>>(
    List<SongUiModel>.empty(growable: true),
  );

  @override
  void onInit() {
    _songRepository = SongRepositoryImpl();
    ohmPlayerController = OhmPlayerController();
    ohmBluetoothController = OhmBluetoothController();
    _getSongsFromAsset();

    super.onInit();
  }

  @override
  void disposeController() {
    ohmPlayerController.disposeController();
    songList.dispose();
    super.disposeController();
  }

  void _getSongsFromAsset() async {
    _songRepository.getSongFromAsset().then((List<SongModel> value) {
      List<SongUiModel> list = <SongUiModel>[];

      for (SongModel model in value) {
        list.add(SongUiModel(songModel: model));
      }

      ohmPlayerController.setSongMetaData(list.first.songModel);

      list[0] = list[0].copyWith(isSelected: true);

      songList.value = list;
    });
  }

  void setAndPlay(SongModel model) async {
    ohmPlayerController.setAndPlay(model);
    _resetList(model.songId);
  }

  void _resetList(String selectedSongId) async {
    List<SongUiModel> list = songList.value;

    for (int i = 0; i < list.length; i++) {
      String songId = list[i].songModel.songId;

      list[i] = list[i].copyWith(isSelected: songId == selectedSongId);
    }

    songList.value = <SongUiModel>[...list];
  }
}
