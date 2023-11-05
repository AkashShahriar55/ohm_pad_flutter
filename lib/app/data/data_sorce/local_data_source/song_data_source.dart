import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

abstract class SongDataSource{
  Future<List<SongModel>> getSongFromAsset();
}