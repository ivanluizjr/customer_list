import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'internet_connection_service.dart';

class InternetConnecionServiceImpl implements IInternetConnectionService {
  @override
  Future<bool> checkConnection() async {
    final result = await InternetConnectionChecker.instance.hasConnection;
    return result;
  }
}
