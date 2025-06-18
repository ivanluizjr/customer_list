import 'package:customer_list/app/core/exception/app_exception.dart';
import 'package:customer_list/app/core/types/type.dart';

class HttpException implements IAppException {
  @override
  final String message;
  final int code;

  const HttpException(this.message, {this.stackTrace, this.code = 0});

  @override
  final StackTrace? stackTrace;

  @override
  FailureType get failureType => FailureType.unknown;
}
