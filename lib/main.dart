import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/src/features/auth/presentation/login/login_page.dart';
import 'package:meetzy/src/features/auth/presentation/register/register_page.dart';
import 'package:meetzy/src/routes/app_routes.dart';
import 'package:meetzy/src/services/local/hive_helper.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await hiveInit();
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(goRouterProvider);

    return ScreenUtilInit(builder: (context, child) {
      return OverlaySupport.global(
          child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: _appTheme,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ));
    });
  }
}

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  // Add more routes as needed
};

final _appTheme = ThemeData(
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    circularTrackColor: ColorApp.white,
    color: ColorApp.orange,
  ),
  primarySwatch: Palette.color,
  dividerColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    elevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: ScreenUtil().setSp(18),
      fontWeight: FontWeight.w600,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  scaffoldBackgroundColor: Palette.colorWhite,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        fontWeight: FontWeight.w600,
        color: Colors.red),
    bodyLarge: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w600,
        color: Colors.yellow),
    bodyMedium: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w600,
        color: ColorApp.gray),
    labelLarge: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w600,
        color: Colors.blue),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 1,
    backgroundColor: Palette.colorWhite,
    selectedItemColor: ColorApp.primary,
    unselectedItemColor: ColorApp.gray,
    showUnselectedLabels: true,
    showSelectedLabels: true,
  ),
);
