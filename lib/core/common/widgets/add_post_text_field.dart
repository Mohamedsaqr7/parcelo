import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';

class AddPostTextField extends StatelessWidget {
  const AddPostTextField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller});
  final String title;
  final String hintText;
  final TextEditingController controller;
  // final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            color: context.color.textColor,
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
            fontWeight: FontWeightHelper.thin,
          ),
        ),
        verticalSpace(10),
        Container(
          height: 40.h,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.regular),
            ),
          ),
          padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
          margin: EdgeInsets.only(right: 20.w),
          decoration: BoxDecoration(
              color: context.color.containerLinear2!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.r)),
        ),
      ],
    );
  }
}
