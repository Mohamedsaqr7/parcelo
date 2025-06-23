import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Parcelo/core/app/connection/no_internet_screen.dart';
import 'package:Parcelo/core/di/dependency_injection.dart';
import 'package:Parcelo/core/routes/base_route.dart';
import 'package:Parcelo/features/admin/order_management/presentation/screen/order_management_screen.dart';
import 'package:Parcelo/features/admin/user_management/presentation/screen/user_management_screen.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';
import 'package:Parcelo/features/auth/login/presentation/screen/login_screen.dart';
import 'package:Parcelo/features/auth/onboarding/onboarding.dart';
import 'package:Parcelo/features/auth/onboarding/splash_screen.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';
import 'package:Parcelo/features/auth/sing_up/presentation/screen/sign_up_screen.dart';
import 'package:Parcelo/features/customer/main_screen/presentation/main_screen.dart';

import '../../features/admin/admin_screen/presentation/screen/admin_main_screen.dart';

class AppRoutes {
  static const String onBoard = 'onBoard';
  static const String splash = 'splash';
  static const String noInternet = 'internet';
  static const String login = 'login';
  static const String mainScreen = 'mainScreen';
  static const String signUp = 'signUp';
  static const String orderManagement = 'orderManagement';
  static const String adminMainScreen = 'adminMainScreen';
  static const String userManagement = 'userManagement';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case splash:
        return BaseRoute(page: SplashScreen());
      case noInternet:
        return BaseRoute(page: NoInternetScreen());
      case onBoard:
        return BaseRoute(page: OnBoardingScreen());
      case mainScreen:
        return BaseRoute(page: MainScreen());
      case adminMainScreen:
        return BaseRoute(page: AdminMainScreen());
      case userManagement:
        return BaseRoute(page: UserManagementScreen());
      case login:
        return BaseRoute(
          page: LoginScreen(),
        );
      case signUp:
        return BaseRoute(
          page: SignUpScreen(),
        );
      case orderManagement:
        return BaseRoute(page: OrderManagementScreen());
      default:
        return BaseRoute(page: MainScreen());
    }
  }
}
