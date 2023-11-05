import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_assets.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/constants/text_styles.dart';
import 'package:ohm_pad_flutter/app/core/widget/asset_image_view.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_player_controller.dart';
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
                Text(
                  "The Day That Never Comes",
                  style: primaryRegular16.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "00:45",
              style: primaryRegular12.copyWith(color: Colors.white),
            ),
            Text(
              "05:00",
              style: primaryRegular12.copyWith(color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppValues.dimen_12.h),
          child: PlayerControls(
            ohmPlayerController: ohmPlayerController,
          ),
        )
      ],
    );
  }
}
