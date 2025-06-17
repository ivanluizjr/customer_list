import 'package:customer_list/app/core/services/http_client_service.dart';
import 'package:customer_list/app/core/services/http_exception.dart';
import 'package:customer_list/app/core/services/http_response.dart';
import 'package:customer_list/app/core/services/http_service_mixin.dart';
import 'package:customer_list/app/core/services/internet_connection/internet_connection_service.dart';
import 'package:dio/dio.dart';

class HttpClientDioServiceImpl extends IHttpClientService
    with HttpServiceMixin {
  final Dio dio;
  final IInternetConnectionService internetConnectionService;

  HttpClientDioServiceImpl({
    required this.dio,
    required this.internetConnectionService,
  });

  @override
  Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    try {
      await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.get(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(data: data);
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> delete(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
        data: body,
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(data: data);
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> post(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.post(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
        data: body,
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(data: data);
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }

  @override
  Future<HttpResponse> put(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      await throwErrorIfNotConnectionWithInternet(internetConnectionService);

      final response = await dio.put(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
        data: body,
      );

      final data = response.data;

      throwErroIfHasInRequest(data);

      return HttpResponse(data: data);
    } on DioException catch (exception) {
      throw HttpException(
        exception.message ?? 'Ops! Algo deu errado.',
        stackTrace: exception.stackTrace,
      );
    }
  }
}
