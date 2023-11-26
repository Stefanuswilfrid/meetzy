import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetzy/firebase_options.dart';
import 'package:meetzy/themes/color_app.dart';
import 'package:meetzy/themes/pallete.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
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
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
