import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/song_list_item.dart';

class SongListView extends StatelessWidget {
  final List<SongModel> songList;
  final Function(SongModel model)? onTapSongItem;

  const SongListView({
    required this.songList,
    this.onTapSongItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            onTapSongItem?.call(songList[index]);
          },
          child: SongListItem(model: songList[index]),
        );
      },
    );
  }
}
