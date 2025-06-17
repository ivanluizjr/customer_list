import 'package:customer_list/app/core/services/http_response.dart';
import 'package:customer_list/app/core/types/type.dart';

abstract class IHttpClientService {
  Future<HttpResponse> get(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });

  Future<HttpResponse> post(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });

  Future<HttpResponse> delete(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });

  Future<HttpResponse> put(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });
}
