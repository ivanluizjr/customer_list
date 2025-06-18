import 'package:customer_list/app/modules/customer_details/controller/states/customer_details_page_state.dart';
import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsPageCubit extends Cubit<ICustomerDetailsPageState> {
  CustomerDetailsPageCubit() : super(CustomerDetailsPageStateInitial());

  CustomerListEntity? customerArgs;
}
