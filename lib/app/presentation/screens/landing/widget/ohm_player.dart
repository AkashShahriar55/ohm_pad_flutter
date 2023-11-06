import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_assets.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/constants/text_styles.dart';
import 'package:ohm_pad_flutter/app/core/widget/asset_image_view.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_player_controller.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/song_meta_data.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/player_controls.dart';

class OhmPlayer extends StatelessWidget {
  final OhmPlayerController ohmPlayerController;

  const OhmPlayer({
    required this.ohmPlayerController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AssetImageView(
                  fileName: AppAssets.icMusicPlayer,
                  color: AppColor.lightGrey.withOpacity(0.4),
                  height: AppValues.dimen_100.h,
                  width: AppValues.dimen_100.w,
                ),
                SizedBox(height: AppValues.dimen_10.h),
                ValueListenableBuilder<SongMetaData?>(
                  valueListenable: ohmPlayerController.currentSong,
                  builder: (BuildContext context, SongMetaData? data, _) {
                    return Text(
                      data?.songName ?? "",
                      style: primaryRegular16.copyWith(color: Colors.white),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        ValueListenableBuilder<SongMetaData?>(
            valueListenable: ohmPlayerController.currentSong,
            builder: (BuildContext context, SongMetaData? data, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _formatDuration(data?.seekDuration),
                    style: primaryRegular12.copyWith(color: Colors.white),
                  ),
                  Text(
                    _formatDuration(data?.duration),
                    style: primaryRegular12.copyWith(color: Colors.white),
                  ),
                ],
              );
            }),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppValues.dimen_12.h),
          child: PlayerControls(
            ohmPlayerController: ohmPlayerController,
          ),
        )
      ],
    );
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return "00:00";
    }

    String twoDigits(int n) {
      if (n >= 10) {
        return "$n";
      } else {
        return "0$n";
      }
    }

    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}";
    } else {
      return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
    }
  }
}
