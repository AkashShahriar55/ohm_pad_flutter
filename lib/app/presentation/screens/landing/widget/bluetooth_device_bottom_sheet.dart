import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/widget/my_bottom_sheet.dart';

class BluetoothDeviceBottomSheet extends StatelessWidget {
  const BluetoothDeviceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyBottomSheet(
      heightFactor: 0.8,
      backgroundColor: AppColor.pageBackgroundColor,
      showCloseButton: false,
      childBuilder: (BuildContext context, ScrollController scrollController) {
        return Container();
      },
    );
  }
}
