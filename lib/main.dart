import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice_website/Pages/MainPage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:practice_website/Pages/MainPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy()); // Убираем # из URL
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: true, // Нативные скроллбары
            physics: const ClampingScrollPhysics(),
          ),
          child: child!,
        );
      },
      home: const MainPage(),
    );
  }
}