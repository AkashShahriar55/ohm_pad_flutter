import 'package:equatable/equatable.dart';

class SongMetaData extends Equatable {
  final String songName;
  final Duration duration;
  final Duration seekDuration;
  final String songAssetPath;

  const SongMetaData({
    required this.songName,
    required this.duration,
    required this.seekDuration,
    required this.songAssetPath,
  });

  SongMetaData copyWith({
    String? songName,
    Duration? duration,
    Duration? seekDuration,
    String? songAssetPath,
  }) {
    return SongMetaData(
      songName: songName ?? this.songName,
      duration: duration ?? this.duration,
      seekDuration: seekDuration ?? this.seekDuration,
      songAssetPath: songAssetPath ?? this.songAssetPath,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        songName,
        duration,
        seekDuration,
        songAssetPath,
      ];
}
