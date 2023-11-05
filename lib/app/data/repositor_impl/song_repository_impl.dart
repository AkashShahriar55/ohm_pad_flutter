import 'package:ohm_pad_flutter/app/data/data_sorce/local_data_source/song_data_source.dart';
import 'package:ohm_pad_flutter/app/data/data_sorce/local_data_source/song_data_source_impl.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/domain/repository/song_repository.dart';

class SongRepositoryImpl extends SongRepository {
  final SongDataSource _songDataSource = SongDataSourceImpl();

  @override
  Future<List<SongModel>> getSongFromAsset() async {
    return _songDataSource.getSongFromAsset();
  }
}
