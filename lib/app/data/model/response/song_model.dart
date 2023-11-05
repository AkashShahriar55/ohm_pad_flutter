import 'package:equatable/equatable.dart';

class SongModel extends Equatable {
  final String songName;
  final String songAssetPath;

  const SongModel({
    required this.songName,
    required this.songAssetPath,
  });

  @override
  List<Object?> get props => <Object?>[
        songName,
        songAssetPath,
      ];
}
