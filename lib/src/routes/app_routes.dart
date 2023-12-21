import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_page.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_page.dart';
import 'package:meetzy/src/features/common/domain/ticket.dart';
import 'package:meetzy/src/features/common/presentation/checkout/checkout_page.dart';
import 'package:meetzy/src/features/common/presentation/event_detail/event_detail_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_botnavbar_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_page.dart';
import 'package:meetzy/src/features/common/presentation/splash/splash_page.dart';
import 'package:meetzy/src/routes/extras.dart';

enum Routes { login, register, home, splash, eventDetail, checkout }

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
        GoRoute(
          path: '/event-detail',
          name: Routes.eventDetail.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final id = extras.datas["id"];
            return EventDetailPage(id: id);
          },
          routes: const [],
        ),
        GoRoute(
          path: '/checkout',
          name: Routes.checkout.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final ticket = extras.datas['ticket'] as Ticket;
            return CheckoutPage(ticket: ticket);
          },
          routes: const [],
        ),
      ],
    );
  },
);
