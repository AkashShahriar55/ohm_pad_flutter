import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/widget/my_bottom_sheet.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/ohm_bluetooth_controller.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/device_ui_model.dart';
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
          child: ValueListenableBuilder<List<DeviceUiModel>>(
              valueListenable: ohmBluetoothController.devices,
              builder:
                  (BuildContext context, List<DeviceUiModel> value, _) {
                return DeviceListView(
                  deviceList: value,
                  onTapDeviceItem: (DiscoveredDevice model) {

                    ohmBluetoothController.connectToDevice(model);
                  },
                );
              }),
        );
      },
    );
  }
}
