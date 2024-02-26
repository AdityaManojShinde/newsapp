import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/views/screens/home_screen.dart';
import 'package:newsapp/views/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
  ],
);
