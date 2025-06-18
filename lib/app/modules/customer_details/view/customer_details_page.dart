import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/button_widget.dart';
import 'package:customer_list/app/core/widgets/text_widget.dart';
import 'package:customer_list/app/modules/customer_details/controller/customer_details_page_cubit.dart';
import 'package:customer_list/app/modules/customer_details/controller/states/customer_details_page_state.dart';
import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsPage extends StatefulWidget {
  final CustomerDetailsPageCubit _cubit;

  const CustomerDetailsPage({
    super.key,
    required CustomerDetailsPageCubit cubit,
  }) : _cubit = cubit;

  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is CustomerListEntity) {
      widget._cubit.customerArgs = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerDetailsPageCubit, ICustomerDetailsPageState>(
      bloc: widget._cubit,
      builder: (context, state) {
        final customer = widget._cubit.customerArgs;

        return Scaffold(
          backgroundColor: context.appColors.white,
          appBar: AppBar(
            backgroundColor: context.appColors.mainColor,
            automaticallyImplyLeading: false,

            centerTitle: true,
            title: TextWidget(
              text: 'Detalhes do Cliente',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              colorText: context.appColors.brown,
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 30.0),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: context.appColors.mainColor,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: context.appColors.brown,
                ),
              ),
              SizedBox(height: 16.0),
              TextWidget(
                text: customer?.nome ?? 'Nome do Cliente',
                fontSize: 22.0,
                colorText: context.appColors.brown,
              ),
              TextWidget(
                text: 'Cliente ID: ${customer?.id ?? 0}',
                fontSize: 12.0,
                colorText: context.appColors.greyNeutral,
              ),
              const SizedBox(height: 40.0),
              TextWidget(
                text: 'Informações do cliente',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                colorText: context.appColors.brown,
              ),
              _divider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Row(
                  children: [
                    TextWidget(
                      text: 'E-mail: ${customer?.email ?? 'email'}',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Row(
                  children: [
                    TextWidget(
                      text: 'Endereço: ${customer?.endereco ?? 'endereço'}',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Row(
                  children: [
                    TextWidget(
                      text: 'Cidade: ${customer?.cidade ?? 'cidade'}',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              _divider(),
              TextWidget(
                text: 'Informações adicionais',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                colorText: context.appColors.brown,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Row(
                  children: [
                    TextWidget(
                      text: 'Idade: ${customer?.idade ?? 'idade'} anos.',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: ButtonWidget.extraLargeWithWidthFlexible(
                  title: 'Voltar para a lista de clientes',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _divider() {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    child: Divider(),
  );
}
