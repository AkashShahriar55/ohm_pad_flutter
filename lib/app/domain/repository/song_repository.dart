import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

abstract class SongRepository {
  Future<List<SongModel>> getSongFromAsset();
}
