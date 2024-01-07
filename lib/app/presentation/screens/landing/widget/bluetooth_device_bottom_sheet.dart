import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/widget/my_bottom_sheet.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_bluetooth_controller.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/bluetooth_device.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/device_list_view.dart';

class BluetoothDeviceBottomSheet extends StatelessWidget {

  final OhmBluetoothController ohmBluetoothController;

  const BluetoothDeviceBottomSheet({
    required this.ohmBluetoothController,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyBottomSheet(
      heightFactor: 0.8,
      backgroundColor: AppColor.pageBackgroundColor,
      showCloseButton: false,
      childBuilder: (BuildContext context, ScrollController scrollController) {
        return Expanded(
          child: ValueListenableBuilder<List<BluetoothDevice>>(
              valueListenable: ohmBluetoothController.devices,
              builder:
                  (BuildContext context, List<BluetoothDevice> value, _) {
                return DeviceListView(
                  deviceList: value,
                  onTapDeviceItem: (BluetoothDevice model) {

                    ohmBluetoothController.connectToDevice(model);
                  },
                );
              }),
        );
      },
    );
  }
}
