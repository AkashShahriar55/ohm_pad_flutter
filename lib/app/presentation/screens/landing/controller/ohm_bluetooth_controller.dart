


import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../../../../core/base/controller.dart';
import '../ui_model/device_ui_model.dart';

class OhmBluetoothController extends Controller{

  final ValueNotifier<double> playerProgress = ValueNotifier<double>(0.0);
  final List<Uuid> serviceList = <Uuid>[];

  final Map<String,DiscoveredDevice> discoveredDevices = <String,DiscoveredDevice>{};

  final Set<String> connectedDevices = <String>{};

  final ValueNotifier<List<DeviceUiModel>> devices = ValueNotifier<List<DeviceUiModel>>([]);


  final FlutterReactiveBle ble = FlutterReactiveBle();



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scanForDevices();
  }

  void scanForDevices(){
    ble.scanForDevices(withServices: <Uuid>[], scanMode: ScanMode.lowLatency).listen((DiscoveredDevice event) {
      discoveredDevices[event.id] = event;
      List<DeviceUiModel> newList = [];
      for(DiscoveredDevice device in discoveredDevices.values){
        var isConnected = connectedDevices.contains(device.id);
        var deviceUi = DeviceUiModel(
            deviceModel: device,
            isConnected: isConnected
        );
        newList.add(deviceUi);

      }
      devices.value = newList;
    });

  }

  void connectToDevice(DiscoveredDevice model) {

  }

  connectedDeviceCount() {
    return connectedDevices.length;
  }





}