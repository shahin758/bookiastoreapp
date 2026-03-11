import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/core/styles/themes.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
    );
  }
}
