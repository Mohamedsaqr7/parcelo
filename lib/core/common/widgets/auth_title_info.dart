import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';

import '../../style/fonts/font_weight.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 450,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
                fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                fontSize: 24.sp,
                fontWeight: FontWeight.bold),
          ),
          verticalSpace(10),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
                fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                color: context.color.textColor2),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
