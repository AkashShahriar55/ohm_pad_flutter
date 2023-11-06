import 'package:ohm_pad_flutter/app/data/data_sorce/local_data_source/song_data_source.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

class SongDataSourceImpl extends SongDataSource {
  @override
  Future<List<SongModel>> getSongFromAsset() async {
    return <SongModel>[
      const SongModel(
        songName: "Guided intro",
        songAssetPath: "audios/guided_Intro.mp3",
      ),
      const SongModel(
        songName: "Beta Rejuvenate",
        songAssetPath: "audios/beta_rejuvenate_741_hz.mp3",
      ),
      const SongModel(
        songName: "Delta Sleep",
        songAssetPath: "audios/delta_sleep_432hz.mp3",
      ),
      const SongModel(
        songName: "Theta Relaxation",
        songAssetPath: "audios/theta_relaxation_528_hz.mp3",
      ),
      const SongModel(
        songName: "Horn",
        songAssetPath: "audios/horn.mp3",
      ),
      const SongModel(
        songName: "Instrumental",
        songAssetPath: "audios/instrumental.mp3",
      ),
      const SongModel(
        songName: "Pop Test",
        songAssetPath: "audios/pop_test.mp3",
      ),
      const SongModel(
        songName: "Rock",
        songAssetPath: "audios/rock.mp3",
      ),
      const SongModel(
        songName: "Small Song",
        songAssetPath: "audios/small_song.mp3",
      ),
      const SongModel(
        songName: "Water",
        songAssetPath: "audios/water.mp3",
      ),
    ];
  }
}
