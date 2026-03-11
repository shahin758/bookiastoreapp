import 'package:bookiastoreapp/feature/auth/presentation/page/create_new_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/forget_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/login_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/otp_verfication_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/password_changed_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/register_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/splash/splash_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/welcome/welcome_screen.dart';
import 'package:bookiastoreapp/feature/home/presentation/page/home_screen.dart';
import 'package:bookiastoreapp/feature/main/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var globalContext = GlobalKey<NavigatorState>();

class Routes {
  static String splashscreen = '/splashscreen';
  static String welcomescreen = '/welcomescreen';
  static String loginscreen = '/loginscreen';
  static String registerscreen = '/registerscreen';
  static String homescreen = '/homescreen';
  static String mainappscreen = '/mainappscreen';
  static String createnewpassword = '/createnewpassword';
  static String otpverfication = '/otpverfication';
  static String passwordchanged = '/passwordchanged';
  static String forgetpassword = '/passwordchanged';

  static var routes = GoRouter(
    navigatorKey: globalContext,
    initialLocation: '/splashscreen',
    routes: [
      GoRoute(path: splashscreen, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: welcomescreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(path: loginscreen, builder: (context, state) => LoginScreen()),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(path: homescreen, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: mainappscreen,
        builder: (context, state) => MainAppScreen(),
      ),
      GoRoute(
        path: createnewpassword,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: otpverfication,
        builder: (context, state) => OtpVerficationScreen(),
      ),
      GoRoute(
        path: passwordchanged,
        builder: (context, state) => PasswordChangedScreen(),
      ),
      GoRoute(
        path: forgetpassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
    ],
  );
}
