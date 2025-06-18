import 'package:customer_list/app/core/exception/app_exception.dart';
import 'package:customer_list/app/core/widgets/either.dart';
import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';

abstract interface class ICustomerListRepository {
  Future<Either<IAppException, List<CustomerListEntity>>> getCustomers();
}
