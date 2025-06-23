import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_container_linera_customer.dart';
import 'package:Parcelo/core/common/widgets/custom_text_field.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/home/logic/home_cubit.dart';

class HomeMainContainer extends StatelessWidget {
  const HomeMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomContainerLinearCustomer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                context.translate(LangKeys.trackurshipment),
                textAlign: TextAlign.center,
                style: context.textStyle.copyWith(
                    color: context.color.containerShadow2,
                    fontSize: 20.sp,
                    fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.bold),
              ),
              verticalSpace(10.h),
              Text(
                context.translate(LangKeys.enterUrTrackNumber),
                textAlign: TextAlign.center,
                style: context.textStyle.copyWith(
                    color: context.color.containerShadow2!.withOpacity(0.9),
                    fontSize: 15.sp,
                    fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.regular),
              ),
              verticalSpace(10.h),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  var cubit = HomeCubit.get(context);

                  return CustomTextField(
                    controller: cubit.search,
                    hintText: context.translate(LangKeys.tracking),
                    keyboardType: TextInputType.text,
                    fillColour: context.color.textColor2,
                    filled: true,
                    prefixIcon: Icon(Icons.track_changes,
                        color: context.color.textColor, size: 20.sp),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          final orderId = cubit.search.text.trim();
                          if (orderId.isNotEmpty) {
                            final order = cubit.fetchOrderById(orderId);
                          }
                        },
                        icon: Icon(Icons.search,
                            color: context.color.textColor, size: 20.sp)),
                  );
                },
              ),
              Image.asset(
                AppAssets.home,
                height: 200.h,
              ),
            ],
          ),
        ),
        height: 400.h,
        width: double.infinity,
      ),
    );
  }
}
