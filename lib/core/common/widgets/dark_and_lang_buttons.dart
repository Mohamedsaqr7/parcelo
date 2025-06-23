import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/app/app_cubit/app_cubit.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_linear_button.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/app_localization.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';

class profileThreeButtons extends StatelessWidget {
  const profileThreeButtons({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomFadeInRight(
              duration: 450,
              child: Card.outlined(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0.w, right: 5.w),
                  child: Row(
                    children: [
                      TextApp(
                        text: cubit.isDark
                            ? context.translate(LangKeys.darkMode)
                            : context.translate(LangKeys.lightMode),
                        theme: context.textStyle.copyWith(
                          color: context.color.textColor,
                          fontSize: 18.sp,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            cubit.changeAppThemeMode();
                          },
                          icon: Icon(
                            size: 40.sp,
                            cubit.isDark ? Icons.dark_mode : Icons.light_mode,
                            color: context.color.greenDark,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            CustomFadeInRight(
              duration: 550,
              child: Card.outlined(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0.w, right: 5.w),
                  child: Row(
                    children: [
                      TextApp(
                        text: context.translate(LangKeys.language),
                        theme: context.textStyle.copyWith(
                          color: context.color.textColor,
                          fontSize: 18.sp,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            if (AppLocalizations.of(context)!.isEnLocale) {
                              cubit.toArabic();
                            } else {
                              cubit.toEnglish();
                            }
                          },
                          icon: Icon(
                            AppLocalizations.of(context)!.isEnLocale
                                ? Icons.translate
                                : Icons.language,
                            size: 40.sp,
                            color: context.color.greenDark,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            CustomFadeInRight(
              duration: 650,
              child: Card.outlined(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0.w, right: 5.w),
                  child: Row(
                    children: [
                      TextApp(
                        text: context.translate(LangKeys.logOut),
                        theme: context.textStyle.copyWith(
                          color: context.color.textColor,
                          fontSize: 18.sp,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            Icons.logout,
                            size: 40.sp,
                            color: context.color.greenDark,
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
