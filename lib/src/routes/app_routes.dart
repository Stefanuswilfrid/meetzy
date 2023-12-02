import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_page.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_botnavbar_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_page.dart';
import 'package:meetzy/src/features/common/presentation/splash/splash_page.dart';

enum Routes { login, register, home, splash }

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routerNeglect: true,
      redirectLimit: 1,
      routes: [
        GoRoute(
          path: '/splash',
          name: Routes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/register',
          name: Routes.register.name,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: Routes.home.name,
          builder: (context, state) => const HomeBotNavBarScreen(),
          routes: const [],
        ),
      ],
    );
  },
);
