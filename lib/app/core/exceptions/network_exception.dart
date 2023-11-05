import 'package:ohm_pad_flutter/app/core/exceptions/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException({String? message}) : super(message: message);
}
