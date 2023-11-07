import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';

class AppLoader extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppLoader({
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      _getLoaderFileName,
      width: width ?? AppValues.dimen_192.w,
      height: height,
      fit: fit,
    );
  }

  String get _getLoaderFileName {
    return 'assets/animations/loader.json';
  }
}
