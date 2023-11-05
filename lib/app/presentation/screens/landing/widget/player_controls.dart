import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_assets.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/widget/asset_image_view.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_player_controller.dart';

class PlayerControls extends StatelessWidget {
  final OhmPlayerController ohmPlayerController;

  const PlayerControls({
    required this.ohmPlayerController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ValueListenableBuilder<double>(
          valueListenable: ohmPlayerController.playerProgress,
          builder: (BuildContext context, double value, _) {
            return Slider(
              value: value,
              max: 100,
              onChanged: (double val) {
                ohmPlayerController.playerProgress.value = val;
              },
              activeColor: Colors.white,
              inactiveColor: AppColor.lightGrey.withOpacity(0.6),
              thumbColor: Colors.white,
            );
          },
        ),
        SizedBox(height: AppValues.dimen_8.h),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              // onTap: ohmPlayerController.i,
              child: AssetImageView(
                fileName: AppAssets.icShuffle,
                height: AppValues.dimen_24.h,
                width: AppValues.dimen_24.w,
              ),
            ),
            SizedBox(width: 24.w),
            GestureDetector(
              onTap: ohmPlayerController.backward,
              child: AssetImageView(
                fileName: AppAssets.icPrevious,
                height: AppValues.dimen_24.h,
                width: AppValues.dimen_24.w,
              ),
            ),
            SizedBox(width: AppValues.dimen_32.w),
            ValueListenableBuilder<PlayerState>(
              valueListenable: ohmPlayerController.playerState,
              builder: (BuildContext context, PlayerState state, _) {
                return GestureDetector(
                  onTap: () {
                    ohmPlayerController.playPause();
                  },
                  child: AssetImageView(
                    fileName: state == PlayerState.paused
                        ? AppAssets.icPlay
                        : AppAssets.icPause,
                    height: AppValues.dimen_24.h,
                    width: AppValues.dimen_24.w,
                  ),
                );
              },
            ),
            SizedBox(width: AppValues.dimen_32.w),
            GestureDetector(
              onTap: ohmPlayerController.forward,
              child: AssetImageView(
                fileName: AppAssets.icNext,
                height: AppValues.dimen_24.h,
                width: AppValues.dimen_24.w,
              ),
            ),
            SizedBox(width: 24.w),
            GestureDetector(
              // onTap: ohmPlayerController.forward,
              child: AssetImageView(
                fileName: AppAssets.icRepeat,
                height: AppValues.dimen_24.h,
                width: AppValues.dimen_24.w,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
