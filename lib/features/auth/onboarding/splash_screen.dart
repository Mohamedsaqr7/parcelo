import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/routes/app_routes.dart'; // غيره حسب مشروعك
import 'package:Parcelo/features/auth/onboarding/onboarding.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../customer/main_screen/presentation/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      final user = Supabase.instance.client.auth.currentUser;

      Navigator.of(context).pushReplacement(_createSlideRoute(
        user != null ? MainScreen() : const OnBoardingScreen(),
      ));
    });
  }

  Route _createSlideRoute(Widget destination) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) =>
          destination, // غيّر حسب اسم الشاشة
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0), // من تحت لفوق
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          AppAssets.splash,
          width: 250.w,
          height: 300.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
