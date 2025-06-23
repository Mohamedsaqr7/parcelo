import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:Parcelo/core/app/app_cubit/app_cubit.dart';
import 'package:Parcelo/core/app/connection/no_internet_screen.dart';
import 'package:Parcelo/core/constants/secure_keys.dart';
import 'package:Parcelo/core/constants/secure_storage.dart';
import 'package:Parcelo/core/di/dependency_injection.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/core/style/theme/app_theme.dart';
import 'package:Parcelo/features/auth/onboarding/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/app/connection/cubit.dart';
import 'core/languages/app_localization_setup.dart';
import 'features/customer/maps/logic/maps_cubit.dart';

class PackageDeliveryApp extends StatefulWidget {
  const PackageDeliveryApp({super.key});

  @override
  State<PackageDeliveryApp> createState() => _PackageDeliveryAppState();
}

class _PackageDeliveryAppState extends State<PackageDeliveryApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // bool _isConnected = true;
  // StreamSubscription? _subscription;
  // void initState() {
  //   super.initState();
  //   _subscription = InternetConnection().onStatusChange.listen((status) {
  //     switch (status) {
  //       case InternetStatus.connected:
  //         setState(() => _isConnected = true);
  //         break;
  //       case InternetStatus.disconnected:
  //         setState(() => _isConnected = false);
  //         break;
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _subscription!.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppCubit>()
            ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(SecureKeys.themeMode))
            ..getSavedLanguage(),
        ),
        BlocProvider(
          create: (_) => MapCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        child: Builder(
          builder: (context) {
            SupabaseClient client = Supabase.instance.client;

            return BlocBuilder<AppCubit, AppState>(
              builder: (context, appState) {
                final appCubit = context.read<AppCubit>();

                return BlocProvider(
                    create: (_) => ConnectionCubit(),
                    child: BlocListener<ConnectionCubit, ConnectionStatus>(
                      listener: (context, state) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (state == ConnectionStatus.disconnected) {
                            navigatorKey.currentState?.push(
                              MaterialPageRoute(
                                  builder: (_) => const NoInternetScreen()),
                            );
                          } else {
                            if (navigatorKey.currentState?.canPop() ?? false) {
                              navigatorKey.currentState?.pop();
                            }
                          }
                        });
                      },
                      child: MaterialApp(
                        navigatorKey: navigatorKey,
                        title: 'Parcelo',
                        debugShowCheckedModeBanner: false,
                        theme: appCubit.isDark ? themeDark() : themeLight(),
                        locale: Locale(appCubit.currentLangCode),
                        supportedLocales:
                            AppLocalizationsSetup.supportedLocales,
                        localizationsDelegates:
                            AppLocalizationsSetup.localizationsDelegates,
                        localeResolutionCallback:
                            AppLocalizationsSetup.localeResolutionCallback,
                        onGenerateRoute: AppRoutes.onGenerateRoute,
                        // initialRoute: AppRoutes.splash,
                        home: SplashScreen(),
                      ),
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
