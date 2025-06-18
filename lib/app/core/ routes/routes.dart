import 'package:customer_list/app/modules/customer_details/view/customer_details_page.dart';
import 'package:customer_list/app/modules/customer_list/view/customer_list_page.dart';
import 'package:customer_list/app/modules/home/view/home_page.dart';
import 'package:customer_list/app/modules/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashPage = '/';
  static const String homePage = '/home-page';
  static const String customerList = '/customer-list-page';
  static const String customerDetails = '/customer-details-page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;

    switch (name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case customerList:
        return MaterialPageRoute(builder: (_) => const CustomerListPage());

      case customerDetails:
        return MaterialPageRoute(builder: (_) => const CustomerDetailsPage());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
