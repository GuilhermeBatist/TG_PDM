import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tg_v1/src/router.dart';

final getIt = GetIt.instance;

void main() {

  getIt.registerSingleton<AppRouter>(AppRouter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: getIt<AppRouter>().config(),

    );
  }
}

