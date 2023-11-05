import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/widget/bottom_sheet_top_bar.dart';
import 'package:ohm_pad_flutter/app/core/widget/widget_builder_typedef.dart';

class MyBottomSheet extends StatelessWidget {
  final BottomSheetBuilder childBuilder;
  final double heightFactor;
  final bool showCloseButton;
  final Color backgroundColor;

  const MyBottomSheet({
    required this.childBuilder,
    this.heightFactor = AppValues.defaultBottomSheetHeightFactor,
    this.showCloseButton = true,
    this.backgroundColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        key: key,
        maxChildSize: heightFactor,
        minChildSize: .4,
        initialChildSize: heightFactor,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValues.dimen_21.r),
                  topRight: Radius.circular(AppValues.dimen_21.r),
                )),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: AppValues.dimen_35.h),
                  child: childBuilder(context, scrollController),
                ),
                BottomSheetTopBar(
                  onClose: _getOnClose(context),
                ),
              ],
            ),
          );
        });
  }

  Function()? _getOnClose(BuildContext context) {
    return showCloseButton
        ? () {
            Navigator.pop(context);
          }
        : null;
  }
}
