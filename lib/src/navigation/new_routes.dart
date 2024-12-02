/*
import 'package:flutter/material.dart';
import 'package:appscom/src/screens/1/page1.dart';
import 'package:appscom/src/screens/2/page2.dart';
import 'package:appscom/src/screens/3/page3.dart';
import 'package:appscom/src/screens/4/page4.dart';
import 'package:appscom/src/screens/5/page5.dart';
import 'package:appscom/src/screens/6/page6.dart';
import 'package:appscom/src/screens/7/page7.dart';
import 'package:appscom/src/screens/8/page8.dart';
import 'package:appscom/src/screens/9/page9.dart';
import 'package:appscom/src/screens/10/page10.dart';
import 'package:appscom/src/screens/home/home_page.dart';
import 'package:appscom/src/screens/routes/routes.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

var goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  errorBuilder: (_, __) => const Scaffold(
    body: Center(
      child: Text("404: Page Not Found"),
    ),
  ),
  routes: <RouteBase>[
    GoRoute(
      path: MobileRoutes.home,
      builder: (BuildContext context, GoRouterState state) =>
          const HomePage(),
      routes: <GoRoute>[
        /// Mobile 1 - 20
        GoRoute(
          path: MobileRoutes.pg1,
          builder: (BuildContext context, GoRouterState state) => const Page1(),
        ),
        GoRoute(
          path: MobileRoutes.pg2,
          builder: (BuildContext context, GoRouterState state) => const Page2(),
        ),
        GoRoute(
          path: MobileRoutes.pg3,
          builder: (BuildContext context, GoRouterState state) => const Page3(),
        ),
        GoRoute(
          path: MobileRoutes.pg4,
          builder: (BuildContext context, GoRouterState state) => const Page4(),
        ),
        GoRoute(
          path: MobileRoutes.pg5,
          builder: (BuildContext context, GoRouterState state) => const Page5(),
        ),
        GoRoute(
          path: MobileRoutes.pg6,
          builder: (BuildContext context, GoRouterState state) => const Page6(),
        ),
        GoRoute(
          path: MobileRoutes.pg7,
          builder: (BuildContext context, GoRouterState state) => const Page7(),
        ),
        GoRoute(
          path: MobileRoutes.pg8,
          builder: (BuildContext context, GoRouterState state) => const Page8(),
        ),
        GoRoute(
          path: MobileRoutes.pg9,
          builder: (BuildContext context, GoRouterState state) => const Page9(),
        ),
        GoRoute(
          path: MobileRoutes.pg10,
          builder: (BuildContext context, GoRouterState state) => const Page10(),
        ),
      ],
    ),
  ],
);
*/