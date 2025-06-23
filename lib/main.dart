import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Parcelo/core/common/widgets/error_widget.dart';
import 'package:Parcelo/core/constants/secure_storage.dart';
import 'package:Parcelo/core/di/dependency_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package_delivery_app.dart';

void main() async {
  ErrorWidget.builder =
      (FlutterErrorDetails details) => CustomErrorScreen(errorDetails: details);
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wjhmnwcghzoxoithcqgg.supabase.co',
    anonKey:
        "Your key",
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // شريط الحالة شفاف
      statusBarIconBrightness: Brightness.dark, // الأيقونات بلون غامق
      statusBarBrightness: Brightness.light, // لأجهزة iOS
    ),
  );
  await setupInjection();
  await SharedPref().instantiatePreferences();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const PackageDeliveryApp());
  });
}
