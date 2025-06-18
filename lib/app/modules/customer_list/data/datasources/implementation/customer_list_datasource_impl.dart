import 'package:customer_list/app/core/services/http_client_service.dart';
import 'package:customer_list/app/core/types/type.dart';
import 'package:customer_list/app/modules/customer_list/data/datasources/i_customer_list_datasource.dart';
import 'package:customer_list/app/modules/customer_list/failures/failures.dart';

class CustomerListDatasourceImpl implements ICustomerListDatasource {
  final IHttpClientService _httpService;

  CustomerListDatasourceImpl({required IHttpClientService httpService})
    : _httpService = httpService;

  @override
  Future<List<Map<String, dynamic>>> getCustomers() async {
    try {
      final response = await _httpService.get('/teste/obterClientes');

      final data = List<Map<String, dynamic>>.from(response.data);

      return data;
    } catch (error, stackTrace) {
      throw Failures(
        message: error.toString(),
        stackTrace: stackTrace,
        type: FailureType.serverError,
      );
    }
  }
}
