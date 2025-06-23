import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30.r),
      elevation: 5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: context.color.greenDark!.withOpacity(0.8), width: 1),
          color: context.color.mainColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 100.h, width: 100.w),
              Column(
                children: [
                  TextApp(
                    text: title,
                    theme: context.textStyle.copyWith(
                        color: context.color.textColor,
                        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.semiBold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: TextApp(
                      textAlign: TextAlign.center,
                      text: description,
                      theme: context.textStyle.copyWith(
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          color: context.color.containerLinear2,
                          fontSize: 15.sp,
                          fontWeight: FontWeightHelper.medium),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
