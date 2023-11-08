

import 'package:equatable/equatable.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class DeviceUiModel extends Equatable {
  final DiscoveredDevice deviceModel;
  final bool isConnected;

  const DeviceUiModel({
    required this.deviceModel,
    this.isConnected = false,
  });

  DeviceUiModel copyWith({
    DiscoveredDevice? deviceModel,
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
