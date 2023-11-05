import 'package:ohm_pad_flutter/app/data/data_sorce/local_data_source/song_data_source.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

class SongDataSourceImpl extends SongDataSource {
  @override
  Future<List<SongModel>> getSongFromAsset() async {
    return <SongModel>[
      const SongModel(
        songName: "Country",
        songAssetPath: "assets/audios/country.mp3",
      ),
      const SongModel(
        songName: "Country 2",
        songAssetPath: "assets/audios/country_2.mp3",
      ),
      const SongModel(
        songName: "Electronic",
        songAssetPath: "assets/audios/electronic.mp3",
      ),
      const SongModel(
        songName: "Hip Hop",
        songAssetPath: "assets/audios/hiphop.mp3",
      ),
      const SongModel(
        songName: "Horn",
        songAssetPath: "assets/audios/horn.mp3",
      ),
      const SongModel(
        songName: "Instrumental",
        songAssetPath: "assets/audios/instrumental.mp3",
      ),
      const SongModel(
        songName: "Pop Test",
        songAssetPath: "assets/audios/pop_test.mp3",
      ),
      const SongModel(
        songName: "Rock",
        songAssetPath: "assets/audios/rock.mp3",
      ),
      const SongModel(
        songName: "Small Song",
        songAssetPath: "assets/audios/small_song.mp3",
      ),
      const SongModel(
        songName: "Water",
        songAssetPath: "assets/audios/water.mp3",
      ),
    ];
  }
}
