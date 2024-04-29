import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/pages/second_page.dart';
import 'package:my_flutter_app/pages/third_page.dart';
import 'package:my_flutter_app/themes/app_theme.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: myTheme,
    );
  }
}

final GoRouter _router = GoRouter(initialLocation: "/home", routes: [
  GoRoute(
    name: "/home",
    path: "/home",
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    name: "/secondPage",
    path: "/secondPage",
    builder: (context, state) => const SecondPage(),
  ),
  GoRoute(
    name: "/thirdPage",
    path: "/thirdPage",
    builder: (context, state) => const ThirdPage(),
  ),
]);


// To-do's
// implement GetX
// change save button
// handle form error cases
// change icons in dropdown field