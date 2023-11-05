import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';

class BottomSheetTopBar extends StatelessWidget {
  final Function()? onClose;

  const BottomSheetTopBar({
    this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  getBottomSheetTipWidget(),
                  if (onClose != null) getBottomSheetCloseButton(),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Align getBottomSheetCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          splashColor: Colors.black12,
          splashRadius: AppValues.dimen_20.r,
          onPressed: onClose,
          icon: const Icon(
            Icons.close_rounded,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }

  Align getBottomSheetTipWidget() {
    return Align(
      child: Container(
        margin: EdgeInsets.only(top: AppValues.dimen_6.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.brightGray,
          ),
          borderRadius: BorderRadius.all(Radius.circular(AppValues.dimen_20.r)),
          color: AppColor.brightGray,
        ),
        height: AppValues.dimen_6.h,
        width: AppValues.dimen_54.w,
      ),
    );
  }
}
