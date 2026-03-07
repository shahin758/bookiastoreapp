import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/core/styles/themes.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  DioProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}
