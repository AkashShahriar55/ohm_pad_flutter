

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_bluetooth_controller.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_values.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/widget/asset_image_view.dart';
import '../ui_model/bluetooth_device.dart';

class DeviceListItem extends StatelessWidget {
  final BluetoothDevice model;
  final Function(BluetoothDevice model)? onTapDeviceItem;

  const DeviceListItem({
    required this.model,
    required this.onTapDeviceItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapDeviceItem?.call(model);
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.dimen_16.h,
              horizontal: AppValues.dimen_10.w,
            ),
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AssetImageView(
                  fileName: AppAssets.icBluetooth,
                  height: AppValues.dimen_24.h,
                  width: AppValues.dimen_24.w,
                  color: Colors.white,
                ),
                SizedBox(width: AppValues.dimen_16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.platformName,
                      style: primaryRegular16.copyWith(color: Colors.white),
                    ),
                    Text(
                      model.remoteId.str,
                      style: primaryRegular12.copyWith(color: Colors.grey),
                    ),
                  ],
                )
                // const Spacer(),
              ],
            ),
          ),
          if (model.isConnected)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Disconnect",
                style: primaryRegular16.copyWith(color: Colors.red),
              ),
            ),
          if(!model.isConnected)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Connect",
                style: primaryRegular16.copyWith(color: Colors.green),
              ),
            ),

        ],
      ),
    );
  }
}
