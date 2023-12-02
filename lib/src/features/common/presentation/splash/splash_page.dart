import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meetzy/src/common_widgets/circle_background/circle_background_widget.dart';
import 'package:meetzy/src/common_widgets/status_bar/status_bar_widget.dart';
import 'package:meetzy/src/routes/app_routes.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  initState() {
    _navigateOtherScreen();
    super.initState();
  }

  void _navigateOtherScreen() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      context.goNamed(Routes.home.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
        child: Scaffold(
      body: CircleBackgroundWidget(
        child: Center(
          child: Image.asset(
            "assets/images/meetzy__logo.png",
            width: MediaQuery.of(context).size.width * (0.60),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ));
  }
}
