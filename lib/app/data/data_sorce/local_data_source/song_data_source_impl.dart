import 'package:ohm_pad_flutter/app/data/data_sorce/local_data_source/song_data_source.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

class SongDataSourceImpl extends SongDataSource {
  @override
  Future<List<SongModel>> getSongFromAsset() async {
    return <SongModel>[
      const SongModel(
        songName: "Country",
        songAssetPath: "audios/country.mp3",
      ),
      const SongModel(
        songName: "Country 2",
        songAssetPath: "audios/country_2.mp3",
      ),
      const SongModel(
        songName: "Electronic",
        songAssetPath: "audios/electronic.mp3",
      ),
      const SongModel(
        songName: "Hip Hop",
        songAssetPath: "audios/hiphop.mp3",
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
