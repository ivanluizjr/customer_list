import 'package:customer_list/app/core/env/env.dart';
import 'package:customer_list/app/core/services/dio/http_client_dio_service_impl.dart';
import 'package:customer_list/app/core/services/http_client_service.dart';
import 'package:customer_list/app/core/services/internet_connection/internet_connection_service.dart';
import 'package:customer_list/app/core/services/internet_connection/internet_connection_service_impl.dart';
import 'package:customer_list/app/modules/customer_details/controller/customer_details_page_cubit.dart';
import 'package:customer_list/app/modules/customer_details/view/customer_details_page.dart';
import 'package:customer_list/app/modules/customer_list/controller/customer_list_cubit.dart';
import 'package:customer_list/app/modules/customer_list/data/datasources/i_customer_list_datasource.dart';
import 'package:customer_list/app/modules/customer_list/data/datasources/implementation/customer_list_datasource_impl.dart';
import 'package:customer_list/app/modules/customer_list/data/repositories/i_customer_list_repository.dart';
import 'package:customer_list/app/modules/customer_list/data/repositories/implementation/customer_list_respository_impl.dart';
import 'package:customer_list/app/modules/customer_list/view/customer_list_page.dart';
import 'package:customer_list/app/modules/home/view/home_page.dart';
import 'package:customer_list/app/modules/splash/view/splash_page.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init(Env env) async {
    await _services(env);
    await _injectableData();
    await _injectableRepositories();
    await _cubits();
    await _pages();
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
    sl.registerLazySingleton<IHttpClientService>(
      () =>
          HttpClientDioServiceImpl(dio: sl(), internetConnectionService: sl()),
    );
    sl.registerLazySingleton<IInternetConnectionService>(
      () => InternetConnecionServiceImpl(),
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

  static Future<void> _cubits() async {
    sl.registerFactory<CustomerListCubit>(
      () => CustomerListCubit(repository: sl<ICustomerListRepository>()),
    );
    sl.registerFactory<CustomerDetailsPageCubit>(
      () => CustomerDetailsPageCubit(),
    );
  }

  static _pages() {
    sl.registerFactory(() => SplashPage());
    sl.registerFactory(() => HomePage());
    sl.registerFactory(() => CustomerListPage(cubit: sl<CustomerListCubit>()));
    sl.registerFactory(
      () => CustomerDetailsPage(cubit: sl<CustomerDetailsPageCubit>()),
    );
  }
}
