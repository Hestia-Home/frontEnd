import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:hestia/core/common/constants/routes.dart';
import 'package:hestia/feature/home/home_screen.dart';
import 'package:hestia/feature/main/presentation/screens/main_screen.dart';
import 'package:hestia/feature/main/presentation/screens/main_screen_wm.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: MainTabRoute.page,
              path: Routes.mainTab,
              children: [
                AutoRoute(
                  initial: true,
                  page: MainRoute.page,
                  path: Routes.main,
                ),
              ],
            ),
            AutoRoute(
              page: AddDeviceTabRoute.page,
              path: Routes.addDeviceTab,
              children: [],
            ),
            AutoRoute(
              page: AddTaskTabRoute.page,
              path: Routes.addTaskTab,
              children: [],
            ),
          ],
        ),
      ];
}

@RoutePage()
class MainTabScreen extends AutoRouter {
  const MainTabScreen({super.key});
}

@RoutePage()
class AddDeviceTabScreen extends AutoRouter {
  const AddDeviceTabScreen({super.key});
}

@RoutePage()
class AddTaskTabScreen extends AutoRouter {
  const AddTaskTabScreen({super.key});
}
