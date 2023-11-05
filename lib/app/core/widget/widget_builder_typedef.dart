import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/app/core/utils/platform_utils.dart';

typedef BottomSheetBuilder = Widget Function(
  BuildContext context,
  ScrollController controller,
);

typedef AdaptiveWidgetBuilder = Widget Function(
  BuildContext context,
  PlatformUtils platformUtils,
);
