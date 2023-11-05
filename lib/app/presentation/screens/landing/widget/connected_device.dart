import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/constants/text_styles.dart';

class ConnectedDevice extends StatelessWidget {
  final Function()? onTap;

  const ConnectedDevice({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppValues.dimen_8.h,
          horizontal: AppValues.dimen_10.w,
        ),
        decoration: BoxDecoration(
          color: AppColor.lightGreen,
          borderRadius: BorderRadius.all(
            Radius.circular(AppValues.dimen_24.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "OnePlus Bullet Z2",
              style: primaryRegular14.copyWith(color: Colors.white),
            ),
            SizedBox(width: AppValues.dimen_12.w),
            const Icon(Icons.arrow_drop_down_circle)
          ],
        ),
      ),
    );
  }
}
