import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/screen.dart';
import 'package:go_router_example/views/home/home_view.dart';
import 'package:go_router_example/views/home/sub_home_view.dart';
import 'package:go_router_example/views/mega/mega_menu.dart';
import 'package:go_router_example/views/player/player_view.dart';
import 'package:go_router_example/views/settings/booking_app.dart';
import 'package:go_router_example/views/settings/sub_setting_view.dart';
import 'package:go_router_example/views/wrapper/main_wrapper.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/social";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorSocial =
      GlobalKey<NavigatorState>(debugLabel: 'shellSocial');
  static final _shellNavigatorBooking =
      GlobalKey<NavigatorState>(debugLabel: 'shellBooking');
  static final _shellNavigatorNotification =
  GlobalKey<NavigatorState>(debugLabel: 'shellNotification');
  static final _shellNavigatorWatch =
  GlobalKey<NavigatorState>(debugLabel: 'shellWatch');
  static final _shellNavigatorMegaMenu =
  GlobalKey<NavigatorState>(debugLabel: 'shellMegaMenu');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach social
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSocial,
            routes: <RouteBase>[
              GoRoute(
                path: "/social",
                name: "social",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeView(),
                routes: [
                  GoRoute(
                    path: 'subSocial',
                    name: 'subSocial',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: const SubHomeView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Brach Booking
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBooking,
            routes: <RouteBase>[
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) => BookingApp(
                  statefulNavigationShell: navigationShell,
                ),
                branches: [
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                          path: "/flight",
                          name: "flight",
                          builder: (context, state) => Screen(title: "FLIGHT"))
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                          path: "/hotel",
                          name: "hotel",
                          builder: (context, state) => Screen(title: "hotel"))
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                          path: "/car",
                          name: "car",
                          builder: (context, state) => Screen(title: "car"))
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                          path: "/tour",
                          name: "tour",
                          builder: (context, state) => Screen(title: "tour"))
                    ],
                  )
                ],
              ),
            ],
          ),
          ///branch notification
          StatefulShellBranch(
            navigatorKey: _shellNavigatorNotification,
            routes: <RouteBase>[
              GoRoute(
                path: "/notification",
                name: "notification",
                builder: (BuildContext context, GoRouterState state) =>
                    const Screen(title: "Notification"),
              ),
            ],
          ),
          ///branch watch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorWatch,
            routes: <RouteBase>[
              GoRoute(
                path: "/watch",
                name: "watch",
                builder: (BuildContext context, GoRouterState state) =>
                const Screen(title: "Watch"),
              ),
            ],
          ),
          ///branch mega menu
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMegaMenu,
            routes: <RouteBase>[
              GoRoute(
                path: "/mega",
                name: "mega",
                builder: (BuildContext context, GoRouterState state) =>
                MegaMenu(),
              ),
            ],
          ),
        ],
      ),

      /// Player
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/player',
        name: "Player",
        builder: (context, state) => PlayerView(
          key: state.pageKey,
        ),
      )
    ],
  );
}
