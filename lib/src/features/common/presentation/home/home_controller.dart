import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/features/common/application/common_service.dart';
import 'package:meetzy/src/features/common/presentation/explore/explore_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_page.dart';
import 'package:meetzy/src/features/common/presentation/home/home_state.dart';
import 'package:meetzy/src/features/common/presentation/my_events/my_events_page.dart';
import 'package:meetzy/src/features/common/presentation/profile/profile_page.dart';
import 'package:meetzy/src/routes/app_routes.dart';
import 'package:meetzy/src/features/common/domain/event.dart';
import 'package:meetzy/src/features/common/domain/home.dart';

class HomeController extends StateNotifier<HomeState> {
  final CommonService _commonService;

  HomeController(this._commonService) : super(HomeState()) {
    // fetchAllEvents();
    fetchEvents();
  }
  bool checkUser() {
    if (state.userValue.hasError || state.userValue.value == null) {
      navigatorKey.currentContext!.goNamed(Routes.login.name);
      return false;
    }
    return true;
  }

  void fetchEvents() async {
    try {
      final events = await _commonService.fetchAllEvents();

      state = state.copyWith(eventListItems: events);
    } catch (e) {
      // Handle errors (e.g., print the error)
      print('Error fetching events: $e');
      return;
    }
  }

  Widget _getScreen(index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const ExplorePage();
      case 2:
        // if (checkUser()) {
        return const MyEventsPage();
      // } else {
      //   return const HomePage();
      // }
      case 3:
        // if (checkUser()) {
        return const ProfilePage();
      // } else {
      //   return const HomePage();
      // }
      default:
        return const HomePage();
    }
  }

  void setPage(index) {
    state = state.copyWith(
      currentIndex: index,
      currentScreen: _getScreen(index),
      isHomeActive: index == 0,
      isExploreActive: index == 1,
      isEventsActive: index == 2,
      isProfileActive: index == 3,
    );
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);

  return HomeController(commonService);
});
