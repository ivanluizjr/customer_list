import 'package:customer_list/app/modules/customer_list/failures/failures.dart';
import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';

abstract class ICustomerListState {}

class CustomerListInitialState implements ICustomerListState {}

class CustomerListLoadingState implements ICustomerListState {}

class CustomerListSuccessState implements ICustomerListState {
  final List<CustomerListEntity> customers;

  CustomerListSuccessState({required this.customers});
}

class CustomerListErrorState implements ICustomerListState {
  final Failures failures;

  CustomerListErrorState({required this.failures});
}
