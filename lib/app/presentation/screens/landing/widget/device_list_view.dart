

import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/bluetooth_device.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/device_list_item.dart';

class DeviceListView extends StatelessWidget {
  final List<BluetoothDevice> deviceList;
  final Function(BluetoothDevice model)? onTapDeviceItem;

  const DeviceListView({
    required this.deviceList,
    this.onTapDeviceItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: deviceList.length,
      shrinkWrap: true,
      primary: true,
      itemBuilder: (BuildContext context, int index) {
        return DeviceListItem(
          key: ValueKey<String>(deviceList[index].remoteId.str),
          model: deviceList[index],
          onTapDeviceItem: onTapDeviceItem,
        );
      },
    );
  }
}
