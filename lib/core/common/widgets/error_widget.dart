import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';

class CustomErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorScreen({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    final error = errorDetails.exceptionAsString();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Error animation
                Image.asset(
                  AppAssets.ops,
                  height: 200,
                ),
                SizedBox(height: 24.h),

                // Title
                TextApp(
                  text: context.translate(LangKeys.error),
                  theme: context.textStyle.copyWith(
                    color: context.color.textColor,
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                SizedBox(height: 12.h),

                // Description
                TextApp(
                  text: context.translate(LangKeys.generalErrorMessage),
                  theme: context.textStyle.copyWith(
                    color: context.color.containerLinear2,
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                SizedBox(height: 30.h),

                // Show Details button
                FilledButton.tonalIcon(
                  icon: const Icon(Icons.info_outline),
                  label: Text(context.translate(LangKeys.showDetails)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(context.translate(LangKeys.errorDetails)),
                        content: Text(error),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // Retry or go back button
                FilledButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: Text(context.translate(LangKeys.tryAgain)),
                  onPressed: () {
                    // You can customize this
                    context.pushName(AppAssets.home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
