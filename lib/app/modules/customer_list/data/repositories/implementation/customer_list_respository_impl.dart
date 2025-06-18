import 'dart:io';

import 'package:customer_list/app/core/exception/app_exception.dart';
import 'package:customer_list/app/core/types/type.dart';
import 'package:customer_list/app/core/widgets/either.dart';
import 'package:customer_list/app/modules/customer_list/data/datasources/i_customer_list_datasource.dart';
import 'package:customer_list/app/modules/customer_list/data/mappers/customer_list_mapper.dart';
import 'package:customer_list/app/modules/customer_list/data/repositories/i_customer_list_repository.dart';
import 'package:customer_list/app/modules/customer_list/failures/failures.dart';
import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';

class CustomerListRepositoryImpl implements ICustomerListRepository {
  final ICustomerListDatasource datasource;

  CustomerListRepositoryImpl({required this.datasource});

  @override
  Future<Either<IAppException, List<CustomerListEntity>>> getCustomers() async {
    try {
      final customers = await datasource.getCustomers();

      final result = customers
          .map((customers) => CustomerListMapper.fromMap(customers))
          .toList();

      return Right(result);
    } on HttpException catch (error, stackTrace) {
      return Left(
        Failures(
          message: error.toString(),
          stackTrace: stackTrace,
          type: FailureType.unknown,
        ),
      );
    }
  }
}
