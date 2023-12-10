import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:hestia/core/navigation/app_router/app_router.dart';

import 'core/di/service_locator.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(
        details.exception, StackTrace.fromString(details.stack.toString()));
  };

  runZonedGuarded<void>(
    _run,
    (error, stackTrace) async {
      dev.log('Unexpected error: $error\n$stackTrace');
    },
  );
}

_run() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator.init();

  runApp(
    ServiceLocator.instance.myApp,
  );
}

class App extends StatelessWidget {
  final AppRouter appRouter;
  const App({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
