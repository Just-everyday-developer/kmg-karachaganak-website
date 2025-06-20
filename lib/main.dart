import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:practice_website/Pages/MainPage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:practice_website/controllers/search_controller.dart' as custom;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy()); // Чтобы убрать # из URL
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<custom.SearchController>(
      create: (context) => custom.SearchController(),
      child: MaterialApp(
        title: "KMG-K.kz",
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
        home: MainPage(),
      ),
    );
  }
}