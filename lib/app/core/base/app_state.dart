import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ohm_pad_flutter/app/core/constants/app_values.dart';
import 'package:ohm_pad_flutter/app/core/exceptions/network_exception.dart';
import 'package:ohm_pad_flutter/app/core/extensions/applocalization_extension.dart';
import 'package:ohm_pad_flutter/app/core/widget/app_loader.dart';

abstract class AppState<T extends StatefulWidget> extends State<T> {
  Widget buildChild(BuildContext context);

  bool _isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return buildChild(context);
  }

  Future<void> showToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: AppValues.dimen_16.sp,
    );
  }

  void onError({
    dynamic exception,
    dynamic argument,
  }) async {
    hideSoftKey();
    if (_isDialogOpen) {
      Navigator.pop(context);
    }

    _parseCommonException(exception);
  }

  void onSuccess(String? successMessage, dynamic argument) {
    hideSoftKey();
    if (_isDialogOpen) {
      Navigator.pop(context);
    }
  }

  void onLoading() {
    _isDialogOpen = true;
    showDialog(
      context: context,
      builder: (BuildContext context) => const AppLoader(),
    ).then((dynamic value) => _isDialogOpen = false);
  }

  void hideSoftKey() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _parseCommonException(dynamic exception) {
    if (exception is NetworkException) {
      showToast(context.localization.noInternetErrorMessage);
    }
  }

  Future<T?> showMyBottomSheet({
    required Widget child,
    Color? backgroundColor,
    bool enableDrag = true,
    bool isDismissible = true,
  }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      isScrollControlled: true,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: child,
        );
      },
    );
  }
}
