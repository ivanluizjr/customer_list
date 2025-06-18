import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/text_widget.dart';
import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';
import 'package:flutter/material.dart';

class CustomerListPageWidget extends StatelessWidget {
  final List<CustomerListEntity> customers;
  final void Function(CustomerListEntity) onCustomerTap;

  const CustomerListPageWidget({
    super.key,
    required this.customers,
    required this.onCustomerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => onCustomerTap(customer),
                  child: TextWidget(
                    text: 'Cliente: ${customer.nome}',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    colorText: context.appColors.brown,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => onCustomerTap(customer),
                      child: TextWidget(
                        text: 'ID: ${customer.id}',
                        colorText: context.appColors.greyNeutral,
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => onCustomerTap(customer),
                      child: TextWidget(
                        text: 'Estado: ${customer.estado}',
                        colorText: context.appColors.greyNeutral,
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
