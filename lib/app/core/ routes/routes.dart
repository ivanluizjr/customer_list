import 'package:flutter/material.dart';

class Routes {
  static const String homePage = '/';
  static const String customerList = '/customer-list';
  static const String customerDetails = '/customer-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;

    switch (name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const Placeholder());

      case customerList:
        return MaterialPageRoute(builder: (_) => const Placeholder());

      case customerDetails:
        return MaterialPageRoute(builder: (_) => const Placeholder());

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
