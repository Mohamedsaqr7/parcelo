import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/orders/logic/orders_cubit.dart';

class UnselectedPastOrder extends StatelessWidget {
  const UnselectedPastOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        var cubit = OrdersCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.changeCurrentState();
            cubit.changePastState();
          },
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(15.r)),
            child: Column(
              children: [
                Image.asset(AppAssets.deliveryMan, width: 120.w, height: 120.h),
                verticalSpace(10.h),
                TextApp(
                    text: context.translate(LangKeys.pastOrders),
                    textAlign: TextAlign.center,
                    theme: context.textStyle.copyWith(
                      color: context.color.textColor,
                      fontSize: 16.sp,
                      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                      fontWeight: FontWeightHelper.medium,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
