// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:risk_dashboard/router/routes.dart';

void main() {
  usePathUrlStrategy();
  initializeDateFormatting("es_MX", null).then((value) => runApp(const MainApp()));
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.routerConfig,
    );
  }
}
