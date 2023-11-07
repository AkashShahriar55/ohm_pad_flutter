import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/base/app_state.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_color.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/data/model/response/song_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/controller/landing_controller.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/ui_model/song_ui_model.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/bluetooth_device_bottom_sheet.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/connected_device.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/ohm_player.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/landing/widget/song_list_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends AppState<LandingScreen> {
  late final LandingController _controller;

  @override
  void initState() {
    _controller = LandingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.disposeController();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pageBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.dimen_20.w,
            vertical: AppValues.dimen_20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ConnectedDevice(
                      onTap: _onTapConnectedDevice,
                    ),
                    Expanded(
                      child: OhmPlayer(
                        ohmPlayerController: _controller.ohmPlayerController,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: ValueListenableBuilder<List<SongUiModel>>(
                    valueListenable: _controller.songList,
                    builder:
                        (BuildContext context, List<SongUiModel> value, _) {
                      return SongListView(
                        songList: value,
                        onTapSongItem: (SongModel model) {
                          _controller.setAndPlay(model);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapConnectedDevice() async {
    showMyBottomSheet(
      backgroundColor: Colors.transparent,
      child: const BluetoothDeviceBottomSheet(),
    );
  }
}
