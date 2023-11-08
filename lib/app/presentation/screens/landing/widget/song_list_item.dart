import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_assets.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/constants/text_styles.dart';
import 'package:ohm_pad_flutter/app/core/widget/asset_image_view.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/song_ui_model.dart';

class SongListItem extends StatelessWidget {
  final SongUiModel model;
  final Function(SongModel model)? onTapSongItem;

  const SongListItem({
    required this.model,
    required this.onTapSongItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSongItem?.call(model.songModel);
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.dimen_16.h,
              horizontal: AppValues.dimen_10.w,
            ),
            color: model.isSelected ? AppColor.nearlyBlack : Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AssetImageView(
                  fileName: AppAssets.icMusicPlayer,
                  height: AppValues.dimen_24.h,
                  width: AppValues.dimen_24.w,
                  color: Colors.white,
                ),
                SizedBox(width: AppValues.dimen_16.w),
                Text(
                  model.songModel.songName,
                  style: primaryRegular16.copyWith(color: Colors.white),
                ),
                // const Spacer(),
              ],
            ),
          ),
          if (model.isSelected)
            Align(
              alignment: Alignment.centerRight,
              child: Lottie.asset(
                AppAssets.musicAnimation,
                width: AppValues.dimen_60.w,
                height: AppValues.dimen_60.h,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
