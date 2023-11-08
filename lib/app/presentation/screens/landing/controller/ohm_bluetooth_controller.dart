


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/base/controller.dart';
import '../ui_model/device_ui_model.dart';

class OhmBluetoothController extends Controller{

  final ValueNotifier<double> playerProgress = ValueNotifier<double>(0.0);
  final List<Uuid> serviceList = <Uuid>[];

  final Map<String,DiscoveredDevice> discoveredDevices = <String,DiscoveredDevice>{};

  final Set<String> connectedDevices = <String>{};

  final ValueNotifier<List<DeviceUiModel>> devices = ValueNotifier<List<DeviceUiModel>>([]);


  final FlutterReactiveBle _ble = FlutterReactiveBle();





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _statusListener();
    _scanForDevices();
  }

  void _scanForDevices() async {
    var status = await Permission.location.status;
    debugPrint("${status.isDenied}");
    if (status.isDenied) {

      // We didn't ask for permission yet or the permission has been denied before, but not permanently.
      if (await Permission.locationWhenInUse.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        _startScanning();

      }else{
        openAppSettings();
      }

    }else{
      _startScanning();
    }


  }

  void connectToDevice(DiscoveredDevice model) {
    _ble.connectToDevice(
      id: model.id,
      connectionTimeout: const Duration(seconds: 2),
    ).listen((connectionState) {
      if(connectionState.connectionState == ConnectionStatus.connected){
        connectedDevices.add(connectionState.deviceId);
      }
      debugPrint("$connectionState");
      // Handle connection state updates
    }, onError: (Object error) {
      // Handle a possible error
      debugPrint("$error");
    });
  }

  connectedDeviceCount() {
    return connectedDevices.length;
  }

  void _startScanning() {
    _ble.scanForDevices(withServices: <Uuid>[], scanMode: ScanMode.balanced).listen((DiscoveredDevice event) {
      debugPrint("$event");
      if(event.connectable == Connectable.available){
        discoveredDevices[event.id] = event;
      }
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

  void _statusListener() {
    _ble.statusStream.listen((status) {
      //code for handling status update
      debugPrint("$status");
    });
  }








}