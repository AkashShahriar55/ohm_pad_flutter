

import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceUiModel extends Equatable {
  final BluetoothDevice deviceModel;
  final bool isConnected;

  const DeviceUiModel({
    required this.deviceModel,
    this.isConnected = false,
  });

  DeviceUiModel copyWith({
    BluetoothDevice? deviceModel,
    bool? isConnected,
  }) {
    return DeviceUiModel(
      deviceModel: deviceModel ?? this.deviceModel,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        deviceModel,
        isConnected,
      ];
}
