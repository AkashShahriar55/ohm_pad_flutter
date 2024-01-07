


import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/base/controller.dart';
import '../ui_model/bluetooth_device.dart';

class OhmBluetoothController extends Controller{

  final ValueNotifier<double> playerProgress = ValueNotifier<double>(0.0);

  final Map<String,BluetoothDevice> discoveredDevices = <String,BluetoothDevice>{};
  final Map<String,bool> connectionMap = <String,bool>{};


  final ValueNotifier<List<BluetoothDevice>> devices = ValueNotifier<List<BluetoothDevice>>([]);


  // Setup Listener for scan results.
  late StreamSubscription<List<ScanResult>> subscription ;





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // if your terminal doesn't support color you'll see annoying logs like `\x1B[1;35m`
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color:true);

    subscription = FlutterBluePlus.scanResults.listen((results) {
      if (results.isNotEmpty) {
        ScanResult r = results.last; // the most recently found device
        discoveredDevices[r.device.remoteId.str] = r.device;
        _refreshList();
      }
    });


  }


  void _askPermission() async{
    var status = await Permission.location.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before, but not permanently.
      if (await Permission.locationWhenInUse.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.

      }else{
        openAppSettings();
      }
    }
  }

  void connectToDevice(BluetoothDevice model) {
    if(model.isConnected){
      model.disconnect();
    }else{
      model.connect();
    }
    _refreshList();

  }

  connectedDeviceCount() {
    return connectionMap.length;
  }

  void startScan() async{
    var status = await Permission.location.status;
    if(status.isDenied){
      _askPermission();
    }else{
      // check if bluetooth is supported by your hardware
      // Note: The platform is initialized on the first call to any FlutterBluePlus method.
      if (await FlutterBluePlus.isSupported == false) {
        print("Bluetooth not supported by this device");
        return;
      }

      // handle bluetooth on & off
      // note: for iOS the initial state is typically BluetoothAdapterState.unknown
      // note: if you have permissions issues you will get stuck at BluetoothAdapterState.unauthorized
      FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
        print(state);
        if (state == BluetoothAdapterState.on) {
          // usually start scanning, connecting, etc
          // Setup Listener for scan results.
          FlutterBluePlus.startScan();

        } else {
          // show an error to the user, etc
        }
      });

      // turn on bluetooth ourself if we can
      // for iOS, the user controls bluetooth enable/disable
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
      }
    }


  }

  void _statusListener() {
  }




  void stopScan(){
    FlutterBluePlus.stopScan();
    discoveredDevices.clear();
    devices.value.clear();
  }





  @override
  void disposeController() {
    // TODO: implement disposeController
    subscription.cancel();
    super.disposeController();

  }

  void _refreshList() {
    var newList = <BluetoothDevice>[];
    for(BluetoothDevice device in discoveredDevices.values){
      newList.add(device);
    }
    devices.value = newList;
  }





}