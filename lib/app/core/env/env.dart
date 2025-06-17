import 'package:flutter/foundation.dart';

enum Env {
  homolog(
    baseUrl: 'https://middleware-mob4pay-homolog.mob4pay.com',
    title: 'customerListHomolog',
  ),
  prod(
    baseUrl: 'https://middleware-mob4pay-homolog.mob4pay.com',
    title: 'customerListProd',
  );

  static Env fromString(String env) {
    debugPrint('Env: $env');
    return Env.values.firstWhere(
      (e) => e.title == env,
      orElse: () => Env.homolog,
    );
  }

  final String baseUrl;
  final String title;

  const Env({required this.baseUrl, required this.title});
}
