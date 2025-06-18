import 'package:customer_list/app/core/%20routes/routes.dart';
import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/text_widget.dart';
import 'package:customer_list/app/modules/customer_list/controller/customer_list_cubit.dart';
import 'package:customer_list/app/modules/customer_list/controller/states/customer_list_state.dart';
import 'package:customer_list/app/modules/customer_list/view/widgets/customer_list_page_widget.dart';
import 'package:customer_list/app/modules/customer_list/view/widgets/customer_list_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListPage extends StatefulWidget {
  final CustomerListCubit _cubit;

  const CustomerListPage({super.key, required CustomerListCubit cubit})
    : _cubit = cubit;

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget._cubit.fetchCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.white,
      appBar: AppBar(
        backgroundColor: context.appColors.mainColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.appColors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: TextWidget(
          text: 'Clientes',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          colorText: context.appColors.brown,
        ),
      ),
      body: BlocBuilder<CustomerListCubit, ICustomerListState>(
        bloc: widget._cubit,
        builder: (context, state) {
          switch (state) {
            case CustomerListLoadingState():
              return const Center(child: CustomerListShimmerWidget());
            case CustomerListErrorState():
              return Center(child: TextWidget(text: state.failures.message));
            case CustomerListSuccessState():
              return CustomerListPageWidget(
                customers: state.customers,
                onCustomerTap: (customer) {
                  Navigator.pushNamed(
                    context,
                    Routes.customerDetails,
                    arguments: customer,
                  );
                },
              );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
