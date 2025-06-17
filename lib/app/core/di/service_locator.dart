import 'package:customer_list/app/core/env/env.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init(Env env) async {
    await _services(env);
    await _injectableData();
    await _injectableRepositories();
    await _cubits();
  }

  static Future<void> _services(Env env) async {}

  static Future<void> _injectableData() async {}

  static Future<void> _injectableRepositories() async {}

  static Future<void> _cubits() async {}
}
