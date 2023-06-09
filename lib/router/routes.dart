import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:risk_dashboard/views/main_view.dart';

class Routes {

  //Name routes
  static const main = '/';

  static final routerConfig = GoRouter(
    initialLocation: main,
    routes: [
      GoRoute(
        path: main,
        pageBuilder: (context, state) => const MaterialPage(child: MainView()),
      )
    ]
  );
}