import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';

class SelectedCurrentOrder extends StatelessWidget {
  const SelectedCurrentOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.r),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: context.color.textColor2,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            Image.asset(AppAssets.currentOrder, width: 120.w, height: 150.h),
            verticalSpace(10.h),
            TextApp(
                text: context.translate(LangKeys.currentOrder),
                textAlign: TextAlign.center,
                theme: context.textStyle.copyWith(
                  color: context.color.textColor,
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.semiBold,
                )),
          ],
        ),
      ),
    );
  }
}
