import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/utils/platform_utils.dart';
import 'package:ohm_pad_flutter/app/core/widget/widget_builder_typedef.dart';

class AdaptiveScreenBuilder extends StatelessWidget {
  final AdaptiveWidgetBuilder builder;

  const AdaptiveScreenBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);
        PlatformUtils platformUtils = PlatformUtils(mediaQueryData);
        return builder(context, platformUtils);
      },
    );
  }
}
