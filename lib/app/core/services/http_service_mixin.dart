import 'package:customer_list/app/core/services/internet_connection/internet_connection_service.dart';

import 'http_exception.dart';

mixin HttpServiceMixin {
  void throwErroIfHasInRequest(dynamic data) {
    if (data is Map && data['error'] != null) {
      throw HttpException(
        data['error']['message'],
        code: data['error']['code'],
      );
    }
  }

  Future<void> throwErrorIfNotConnectionWithInternet(
    IInternetConnectionService service,
  ) async {
    final hasConnection = await service.checkConnection();

    if (!hasConnection) {
      throw const HttpException(
        'Ops! Algo deu errado. Por favor, verifique sua conexão com a internet e tente novamente.',
        code: 0,
      );
    }
  }
}
