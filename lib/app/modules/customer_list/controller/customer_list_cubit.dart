import 'package:customer_list/app/core/types/type.dart';
import 'package:customer_list/app/modules/customer_list/controller/states/customer_list_state.dart';
import 'package:customer_list/app/modules/customer_list/data/repositories/i_customer_list_repository.dart';
import 'package:customer_list/app/modules/customer_list/failures/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListCubit extends Cubit<ICustomerListState> {
  final ICustomerListRepository _repository;

  CustomerListCubit({required ICustomerListRepository repository})
    : _repository = repository,
      super(CustomerListInitialState());

  Future<void> fetchCustomers() async {
    emit(CustomerListLoadingState());

    try {
      final result = await _repository.getCustomers();

      result.fold(
        onLeft: (error) => emit(
          CustomerListErrorState(
            failures: Failures(message: error.message, type: error.failureType),
          ),
        ),
        onRight: (success) =>
            emit(CustomerListSuccessState(customers: success)),
      );
    } catch (error) {
      if (error is Failures) {
        emit(CustomerListErrorState(failures: error));
      } else {
        emit(
          CustomerListErrorState(
            failures: Failures(
              message: 'Ocorreu um erro inesperado. Tente novamente.',
              type: FailureType.unknown,
            ),
          ),
        );
      }
    }
  }
}
