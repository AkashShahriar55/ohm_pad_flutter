import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohm_pad_flutter/app/presentation/screens/splash/view_model/splash_controller.dart';
import 'package:ohm_pad_flutter/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashController _controller;

  @override
  void initState() {
    _controller = SplashController();
    _controller.delay(onFinished: () {
      context.pushReplacementNamed(AppRoutes.landing);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}
