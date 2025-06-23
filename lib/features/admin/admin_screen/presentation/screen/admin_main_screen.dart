import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_home_container.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // appBar: AppBar(
      //   elevation: 0,
      //   bottomOpacity: 1,
      //   title: TextApp(
      //     textAlign: TextAlign.center,
      //     text: 'Admin Dashboard',
      //     theme: TextStyle(
      //       color: context.color.greenDark,
      //       fontSize: 20.sp,
      //       fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      //       fontWeight: FontWeightHelper.bold,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFadeInRight(
                duration: 500,
                child: InkWell(
                  onTap: () => context.pushName(AppRoutes.orderManagement),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.r),
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: context.color.greenDark!.withOpacity(0.8),
                            width: 1),
                        color: context.color.mainColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.deliveryMan,
                                height: 100.h, width: 100.w),
                            horizontalSpace(10),
                            TextApp(
                              text: "Manage all orders",
                              theme: context.textStyle.copyWith(
                                  color: context.color.textColor,
                                  fontFamily:
                                      FontFamilyHelper.geLocalozedFontFamily(),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeightHelper.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(60.h),
              CustomFadeInRight(
                duration: 600,
                child: InkWell(
                  onTap: () => context.pushName(AppRoutes.userManagement),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.r),
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: context.color.greenDark!.withOpacity(0.8),
                            width: 1),
                        color: context.color.mainColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.admin,
                                height: 100.h, width: 100.w),
                            horizontalSpace(10),
                            TextApp(
                              text: "Manage all users",
                              theme: context.textStyle.copyWith(
                                  color: context.color.textColor,
                                  fontFamily:
                                      FontFamilyHelper.geLocalozedFontFamily(),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeightHelper.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
