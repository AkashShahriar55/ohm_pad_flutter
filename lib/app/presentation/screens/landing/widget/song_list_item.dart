import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_assets.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/constants/text_styles.dart';
import 'package:ohm_pad_flutter/app/core/widget/asset_image_view.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';

class SongListItem extends StatelessWidget {
  final SongModel model;

  const SongListItem({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppValues.dimen_16.h,
        horizontal: AppValues.dimen_10.w,
      ),
      //color: Colors.black,
      child: Row(
        children: <Widget>[
          AssetImageView(
            fileName: AppAssets.icMusicPlayer,
            height: AppValues.dimen_24.h,
            width: AppValues.dimen_24.w,
            color: Colors.white,
          ),
          SizedBox(width: AppValues.dimen_16.w),
          Text(
            model.songName,
            style: primaryRegular16.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
