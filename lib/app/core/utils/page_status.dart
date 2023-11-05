enum PageState { DEFAULT, SUCCESS, ERROR, LOADING }

class PageStatus {
  final PageState pageState;
  String? successMessage;
  dynamic exception;
  dynamic argument;

  PageStatus({
    this.pageState = PageState.DEFAULT,
    this.successMessage,
    this.exception,
    this.argument,
  });
}
