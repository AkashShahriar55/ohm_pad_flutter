

import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/device_ui_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/device_list_item.dart';

class DeviceListView extends StatelessWidget {
  final List<DeviceUiModel> deviceList;
  final Function(DiscoveredDevice model)? onTapDeviceItem;

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
          key: ValueKey<String>(deviceList[index].deviceModel.id),
          model: deviceList[index],
          onTapDeviceItem: onTapDeviceItem,
        );
      },
    );
  }
}
