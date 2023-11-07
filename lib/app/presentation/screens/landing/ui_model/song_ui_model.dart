import 'package:equatable/equatable.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

class SongUiModel extends Equatable {
  final SongModel songModel;
  final bool isSelected;

  const SongUiModel({
    required this.songModel,
    this.isSelected = false,
  });

  SongUiModel copyWith({
    SongModel? songModel,
    bool? isSelected,
  }) {
    return SongUiModel(
      songModel: songModel ?? this.songModel,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        songModel,
        isSelected,
      ];
}
