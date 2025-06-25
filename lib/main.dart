import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:practice_website/Pages/MainPage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:practice_website/controllers/search_controller.dart' as custom;
import 'controllers/theme_mode_toggler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy()); // Чтобы убрать # из URL
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => custom.SearchController()),
        ChangeNotifierProvider(create: (_) => ThemeToggler())
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "KMG-K.kz",
        debugShowCheckedModeBanner: false,
        // showSemanticsDebugger: true,
        theme: context.watch<ThemeToggler>().themeData,
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
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
    );
  }
}