import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/features/auth/presentation/login/login_page.dart';
import 'package:meetzy/features/auth/presentation/register/register_page.dart';
import 'package:meetzy/firebase_options.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return OverlaySupport.global(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: _appTheme,
        initialRoute: '/login',
        routes: routes,
      ));
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
