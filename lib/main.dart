import 'package:customer_list/app/app_widget.dart';
import 'package:customer_list/app/core/di/service_locator.dart';
import 'package:customer_list/app/core/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Color(0xFFBB8668)),
  );

  final env = Env.fromString(
    const String.fromEnvironment('env', defaultValue: 'prod'),
  );
  await ServiceLocator.init(env);

  runApp(const AppWidget());
}
