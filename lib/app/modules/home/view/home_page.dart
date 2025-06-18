import 'package:customer_list/app/core/%20routes/routes.dart';
import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/button_widget.dart';
import 'package:customer_list/app/core/widgets/image_assets_widget.dart';
import 'package:customer_list/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.white,
      appBar: AppBar(backgroundColor: context.appColors.mainColor),
      body: Column(
        children: [
          ImageAssetsWidget.imageHome(),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
            child: TextWidget(
              text: 'Carregar Lista de Clientes',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
            child: TextWidget(
              text:
                  'Mantenha-se organizado e acompanhe todas as interações com os seus clientes.',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
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
              title: 'Vamos começar',
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.customerList),
            ),
          ),
        ],
      ),
    );
  }
}
