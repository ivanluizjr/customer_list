import 'package:customer_list/app/core/%20routes/fade_route.dart';
import 'package:customer_list/app/core/di/service_locator.dart';
import 'package:customer_list/app/modules/customer_details/view/customer_details_page.dart';
import 'package:customer_list/app/modules/customer_list/view/customer_list_page.dart';
import 'package:customer_list/app/modules/home/view/home_page.dart';
import 'package:customer_list/app/modules/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Routes {
  static const String splashPage = '/';
  static const String homePage = '/home-page';
  static const String customerList = '/customer-list-page';
  static const String customerDetails = '/customer-details-page';

  static Map<String, WidgetBuilder> get routes => {
    splashPage: (context) => sl<SplashPage>(),
    homePage: (context) => sl<HomePage>(),
    customerList: (context) => sl<CustomerListPage>(),
    customerDetails: (context) => sl<CustomerDetailsPage>(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;

    switch (name) {
      case splashPage:
        return FadeRoute(page: sl<SplashPage>(), settings: settings);
      case homePage:
        return FadeRoute(page: sl<HomePage>(), settings: settings);
      case customerList:
        return FadeRoute(page: sl<CustomerListPage>(), settings: settings);
      case customerDetails:
        return FadeRoute(page: sl<CustomerDetailsPage>(), settings: settings);
    }

    return null;
  }

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   final name = settings.name;

  //   switch (name) {
  //     case splashPage:
  //       return MaterialPageRoute(builder: (_) => const SplashPage());

  //     case homePage:
  //       return MaterialPageRoute(builder: (_) => const HomePage());

  //     case customerList:
  //       return MaterialPageRoute(
  //         builder: (_) => CustomerListPage(cubit: sl<CustomerListCubit>()),
  //       );

  //     case customerDetails:
  //       final customer = settings.arguments as CustomerListEntity;

  //       return MaterialPageRoute(
  //         builder: (_) => CustomerDetailsPage(
  //           cubit: CustomerDetailsPageCubit(customerArgs: customer),
  //         ),
  //       );

  //     default:
  //       return MaterialPageRoute(builder: (_) => const HomePage());
  //   }
  // }
}
