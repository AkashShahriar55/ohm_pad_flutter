import 'package:equatable/equatable.dart';

class SongModel extends Equatable {
  final String songId;
  final String songName;
  final String songAssetPath;

  const SongModel({
    required this.songId,
    required this.songName,
    required this.songAssetPath,
  });

  @override
  List<Object?> get props => <Object?>[
        songId,
        songName,
        songAssetPath,
      ];
}
