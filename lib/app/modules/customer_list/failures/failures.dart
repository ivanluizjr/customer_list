import 'package:customer_list/app/core/exception/app_exception.dart';
import 'package:customer_list/app/core/types/type.dart';

abstract interface class IFailures implements IAppException {
  @override
  abstract final String message;
  @override
  abstract final StackTrace? stackTrace;
  abstract final FailureType type;

  @override
  FailureType get failureType;
}

class Failures implements IFailures {
  @override
  final String message;
  @override
  final StackTrace? stackTrace;
  @override
  final FailureType type;

  Failures({required this.message, required this.type, this.stackTrace});

  static String _mapTypeToMessage(FailureType type) {
    switch (type) {
      case FailureType.invalidCredentials:
        return 'Credenciais inválidas!';
      case FailureType.accessDenied:
        return 'Acesso negado!';
      case FailureType.serverError:
        return 'Erro no servidor!';
      case FailureType.badRequest:
        return 'Dados mal formatados!';
      case FailureType.timeOutServer:
        return 'Sem resposta do servidor!';
      default:
        return 'Erro inesperado!';
    }
  }

  static FailureType mapStatusCodeToFailureType(int statusCode) {
    switch (statusCode) {
      case 401:
        return FailureType.invalidCredentials;
      case 403:
        return FailureType.accessDenied;
      case 400:
        return FailureType.badRequest;
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        return FailureType.serverError;
      case 0:
        return FailureType.timeOutServer;
      default:
        return FailureType.unknown;
    }
  }

  factory Failures.fromStatusCode(int statusCode, {StackTrace? stackTrace}) {
    final type = mapStatusCodeToFailureType(statusCode);
    final message = _mapTypeToMessage(type);
    return Failures(message: message, type: type, stackTrace: stackTrace);
  }

  @override
  FailureType get failureType => type;

  @override
  String toString() {
    return 'Failures(type: $type, message: "$message")';
  }
}

class FailuresInternet extends Failures {
  FailuresInternet({super.stackTrace})
    : super(
        message: 'Sem resposta do servidor!',
        type: FailureType.timeOutServer,
      );
}
