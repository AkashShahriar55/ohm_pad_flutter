import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_assets.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/constants/text_styles.dart';
import 'package:ohm_pad_flutter/app/core/widget/asset_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final Function()? onBackPressed;
  final bool isCenterTitle;
  final Color iconColor;
  final double iconSize;
  final double? elevation;
  final Color? appBarBackgroundColor;
  final TextStyle? titleStyle;

  const CustomAppBar({
    Key? key,
    this.appBarTitle,
    this.actions,
    this.isBackButtonEnabled = true,
    this.onBackPressed,
    this.isCenterTitle = false,
    this.iconSize = AppValues.dimen_24,
    this.iconColor = AppColor.primaryColor,
    this.appBarBackgroundColor,
    this.titleStyle,
    this.elevation,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: isBackButtonEnabled
          ? InkWell(
              onTap: onBackPressed ?? () => Navigator.pop(context),
              child: Center(
                child: SizedBox(
                  height: iconSize,
                  width: iconSize,
                  child: AssetImageView(
                    fileName: AppAssets.icArrowLeft,
                    height: iconSize,
                    width: iconSize,
                    color: iconColor,
                  ),
                ),
              ),
            )
          : null,
      backgroundColor: appBarBackgroundColor ?? AppColor.pageBackgroundColor,
      centerTitle: isCenterTitle,
      elevation: elevation,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: IconThemeData(color: iconColor),
      title: appBarTitle != null
          ? Text(
              appBarTitle!,
              style: titleStyle ?? primaryRegular16,
            )
          : Container(),
    );
  }
}
