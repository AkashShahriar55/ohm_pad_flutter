import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ohm_pad_flutter/app/core/utils/platform_utils.dart';
import 'package:ohm_pad_flutter/app/core/widget/adaptive_screen_builder.dart';
import 'package:ohm_pad_flutter/app/routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/constants/app_values.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScreenBuilder(
        builder: (BuildContext context, PlatformUtils platformUtils) {
      return ScreenUtilInit(
          designSize: _getLayoutSize(platformUtils),
          minTextAdapt: true,
          builder: (BuildContext context, Widget? widget) {
            return MaterialApp.router(
              routerConfig: appRouter,
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                DefaultWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                // Locale('es'), // Spanish
              ],
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            );
          });
    });
  }

  Size _getLayoutSize(PlatformUtils platformUtils) {
    if (platformUtils.screenType == AdaptiveScreenType.mobile &&
        platformUtils.screenOrientation == ScreenOrientation.portrait) {
      return const Size(
        AppValues.defaultMobileLayoutWidth,
        AppValues.defaultMobileLayoutHeight,
      );
    } else if (platformUtils.screenType == AdaptiveScreenType.mobile &&
        platformUtils.screenOrientation == ScreenOrientation.landscape) {
      return const Size(
        AppValues.defaultMobileLayoutHeight,
        AppValues.defaultMobileLayoutWidth,
      );
    } else if (platformUtils.screenType == AdaptiveScreenType.tablet &&
        platformUtils.screenOrientation == ScreenOrientation.landscape) {
      return const Size(
        AppValues.defaultTabletLayoutHeight,
        AppValues.defaultTabletLayoutWidth,
      );
    } else if (platformUtils.screenType == AdaptiveScreenType.tablet &&
        platformUtils.screenOrientation == ScreenOrientation.portrait) {
      return const Size(
        AppValues.defaultTabletLayoutWidth,
        AppValues.defaultTabletLayoutHeight,
      );
    } else {
      return const Size(
        AppValues.defaultMobileLayoutWidth,
        AppValues.defaultMobileLayoutHeight,
      );
    }
  }
}
