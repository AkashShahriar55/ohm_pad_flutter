import 'package:flutter/cupertino.dart';
import 'package:ohm_pad_flutter/app/core/base/base_controller.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/data/repositor_impl/song_repository_impl.dart';
import 'package:ohm_pad_flutter/app/domain/repository/song_repository.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_player_controller.dart';

class LandingController extends BaseController {
  late final OhmPlayerController ohmPlayerController;
  late final SongRepository _songRepository;

  final ValueNotifier<List<SongModel>> songList =
      ValueNotifier<List<SongModel>>(
    List<SongModel>.empty(growable: true),
  );

  @override
  void onInit() {
    _songRepository = SongRepositoryImpl();
    ohmPlayerController = OhmPlayerController();
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
      songList.value = value;
      ohmPlayerController.setSongMetaData(songList.value.first);
    });
  }
}
