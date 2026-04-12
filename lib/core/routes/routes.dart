import 'package:bookiastoreapp/core/di/service_locator.dart';
import 'package:bookiastoreapp/feature/accept_order/presentation/page/accept_order_screen.dart';

import 'package:bookiastoreapp/feature/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:bookiastoreapp/feature/auth/data/repo/auth_repo_imp.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/register_usecase.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/create_new_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/forget_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/login_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/otp_verfication_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/password_changed_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/register_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/splash/splash_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/welcome/welcome_screen.dart';
import 'package:bookiastoreapp/feature/details/presentation/page/details_screen.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/product.dart';
import 'package:bookiastoreapp/feature/home/presentation/page/home_screen.dart';
import 'package:bookiastoreapp/feature/main/main_app_screen.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/update_password/presentation/page/update_password.dart';
import 'package:bookiastoreapp/feature/my_orders/presentation/page/my_order_screen.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/cubit/edite_profile_cubit.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/page/edite_profile2.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/page/wishlist_page.dart';
import 'package:bookiastoreapp/feature/place_order/presentation/page/place_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

var globalContext = GlobalKey<NavigatorState>();

class Routes {
  static const String splashscreen = '/splashscreen';
  static const String welcomescreen = '/welcomescreen';
  static const String loginscreen = '/loginscreen';
  static const String registerscreen = '/registerscreen';
  static const String homescreen = '/homescreen';
  static const String mainappscreen = '/mainappscreen';
  static const String createnewpassword = '/createnewpassword';
  static const String otpverfication = '/otpverfication';
  static const String passwordchanged = '/passwordchanged';
  static const String forgetpassword = '/forgetpassword';
  static const String detailsscreen = '/detailsscreen';
  static const String wishlistscreen = '/wishlistscreen';
  static const String placeOrder = '/place-order';
  static const String acceptOrder = '/acceptorder';
  //static const String editprofile = '/editprofile';
  static const String editprofile2 = '/editprofile2';
  static const String updatepassword = '/newpasswordscreen';
  static const String myorders = '/myorders';

  static final GoRouter router = GoRouter(
    navigatorKey: globalContext,
    initialLocation: '/splashscreen',
    routes: [
      GoRoute(path: splashscreen, builder: (context, state) => SplashScreen()),
//---------------------------------------------------------------------------------
      GoRoute(
        path: welcomescreen,
        builder: (context, state) => WelcomeScreen(),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
          path: loginscreen,
          builder: (context, state) => BlocProvider(
                create: (context) => AuthCubit(
                  getIt<LoginUsecase>(),
                  registerUsecase: getIt<RegisterUsecase>(),
                ),
                child: LoginScreen(),
              )),

//---------------------------------------------------------------------------------
      GoRoute(
        path: registerscreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(
            LoginUsecase(AuthReposatoryImp(AuthRemoteDateSourceImpl())),
            registerUsecase:
                RegisterUsecase(AuthReposatoryImp(AuthRemoteDateSourceImpl())),
          ),
          child: RegisterScreen(),
        ),
      ),
//---------------------------------------------------------------------------------
      GoRoute(path: homescreen, builder: (context, state) => HomeScreen()),
//---------------------------------------------------------------------------------
      GoRoute(
        path: mainappscreen,
        builder: (context, state) {
          var selectedIndex = state.extra as int?;
          return MainAppScreen(selectedIndex: selectedIndex);
        },
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: createnewpassword,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: otpverfication,
        builder: (context, state) => OtpVerficationScreen(),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: passwordchanged,
        builder: (context, state) => PasswordChangedScreen(),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: forgetpassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
//
      GoRoute(
        path: detailsscreen,
        builder: (context, state) =>
            DetailsScreen(model: state.extra as Product),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: wishlistscreen,
        builder: (context, state) => BlocProvider(
          create: (context) => WishlistCubit(),
          child: WishlistScreen(),
        ),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: placeOrder,
        builder: (context, state) =>
            PlaceOrderScreen(total: state.extra as String),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: acceptOrder,
        builder: (context, state) => AcceptOrderScreen(),
      ),
      // GoRoute(
      // path: editprofile,
      // builder: (context, state) => EditProfileScreen(),
      //),
      GoRoute(
        path: editprofile2,
        builder: (context, state) => BlocProvider(
          create: (context) => EditeProfileCubit()..loadInitialData(),
          child: EditeProfile2(),
        ),
      ),
//---------------------------------------------------------------------------------
      GoRoute(
        path: updatepassword,
        builder: (context, state) => UpdatePassword(),
      ),
//---------------------------------------------------------------------------------

      GoRoute(path: myorders, builder: (context, state) => MyOrdersScreen()),
    ],
  );
}
