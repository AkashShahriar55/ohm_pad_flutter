import 'package:flutter/cupertino.dart';
import 'package:ohm_pad_flutter/app/core/base/controller.dart';
import 'package:ohm_pad_flutter/app/core/utils/page_status.dart';

class BaseController extends Controller {
  ///Controls the page state
  final ValueNotifier<PageStatus> pageStatusNotifier =
      ValueNotifier<PageStatus>(PageStatus());

  void _updatePageStatus(PageStatus pageStatus) {
    pageStatusNotifier.value = pageStatus;
  }

  void setSuccess({String? successMessage, dynamic argument}) {
    _updatePageStatus(PageStatus(
      pageState: PageState.SUCCESS,
      successMessage: successMessage,
      argument: argument,
    ));
  }

  void setError({dynamic exception, dynamic argument}) {
    _updatePageStatus(PageStatus(
      pageState: PageState.ERROR,
      exception: exception,
      argument: argument,
    ));
  }

  void setLoading() {
    _updatePageStatus(PageStatus(
      pageState: PageState.LOADING,
    ));
  }

  void resetPage() {
    _updatePageStatus(PageStatus(
      pageState: PageState.DEFAULT,
    ));
  }

  @override
  void disposeController() {
    pageStatusNotifier.dispose();
  }
}
