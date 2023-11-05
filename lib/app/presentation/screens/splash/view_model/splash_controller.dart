import 'package:ohm_pad_flutter/app/core/base/base_controller.dart';

class SplashController extends BaseController {
  void delay({required Function() onFinished, int seconds = 3}) {
    Future<void>.delayed(Duration(seconds: seconds))
        .then((value) async => onFinished.call());
  }
}
