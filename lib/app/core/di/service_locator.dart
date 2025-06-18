import 'package:customer_list/app/core/env/env.dart';
import 'package:customer_list/app/core/services/dio/http_client_dio_service_impl.dart';
import 'package:customer_list/app/core/services/internet_connection/internet_connection_service.dart';
import 'package:customer_list/app/core/services/internet_connection/internet_connection_service_impl.dart';
import 'package:customer_list/app/modules/customer_list/data/datasources/i_customer_list_datasource.dart';
import 'package:customer_list/app/modules/customer_list/data/datasources/implementation/customer_list_datasource_impl.dart';
import 'package:customer_list/app/modules/customer_list/data/repositories/i_customer_list_repository.dart';
import 'package:customer_list/app/modules/customer_list/data/repositories/implementation/customer_list_respository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init(Env env) async {
    await _services(env);
    await _injectableData();
    await _injectableRepositories();
    await _cubits();
  }

  static Future<void> _services(Env env) async {
    sl.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: env.baseUrl,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        ),
      ),
    );
    sl.registerLazySingleton<IInternetConnectionService>(
      () => InternetConnecionServiceImpl(),
    );
    sl.registerLazySingleton(
      <IHttpClientService>() =>
          HttpClientDioServiceImpl(dio: sl(), internetConnectionService: sl()),
    );
  }

  static Future<void> _injectableData() async {
    sl.registerLazySingleton<ICustomerListDatasource>(
      () => CustomerListDatasourceImpl(httpService: sl()),
    );
  }

  static Future<void> _injectableRepositories() async {
    sl.registerLazySingleton<ICustomerListRepository>(
      () => CustomerListRepositoryImpl(datasource: sl()),
    );
  }

  static Future<void> _cubits() async {}
}
