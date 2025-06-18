abstract class ICustomerDetailsPageState {}

class CustomerDetailsPageStateInitial implements ICustomerDetailsPageState {}

class CustomerDetailsPageStateLoading implements ICustomerDetailsPageState {}

class CustomerDetailsPageStateSuccess implements ICustomerDetailsPageState {}

class CustomerDetailsPageStateError implements ICustomerDetailsPageState {
  final String message;

  CustomerDetailsPageStateError(this.message);
}
