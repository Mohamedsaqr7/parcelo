import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/extensions/strring_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/orders/logic/orders_cubit.dart';

class PastOrderBody extends StatelessWidget {
  const PastOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is Success && state.pastOrders.isNotEmpty) {
          final order = state.pastOrders;
          var cubit = OrdersCubit.get(context);
          return CustomFadeInRight(
            duration: 450,
            child: Container(
              color: context.color.textColor2!.withOpacity(0.2),
              width: double.infinity,
              height: 300.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => verticalSpace(10.h),
                itemCount: order.length,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.7, color: context.color.containerLinear2!),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.deliveryBike,
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                        ),
                        horizontalSpace(5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: order[index].dropOffName.length > 12
                                  ? '${order[index].dropOffName.substring(0, 12)}...'
                                  : order[index].dropOffName,
                              theme: context.textStyle.copyWith(
                                  color: context.color.textColor,
                                  fontSize: 14.sp,
                                  fontFamily:
                                      FontFamilyHelper.geLocalozedFontFamily(),
                                  fontWeight: FontWeightHelper.medium),
                            ),
                            SizedBox(
                              width: 80.w,
                              child: TextApp(
                                text: order[index].orderId,
                                theme: context.textStyle.copyWith(
                                    color: context.color.textColor,
                                    fontSize: 12.sp,
                                    fontFamily: FontFamilyHelper
                                        .geLocalozedFontFamily(),
                                    fontWeight: FontWeightHelper.medium),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height: 22.h,
                          width: 130.w,
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              color: context.color.greenLight,
                              borderRadius: BorderRadius.circular(5)),
                          child: TextApp(
                            textOverflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            text: cubit.getOrderStatus(
                                order[index].currentState, context),
                            theme: context.textStyle.copyWith(
                                fontFamily:
                                    FontFamilyHelper.geLocalozedFontFamily(),
                                fontWeight: FontWeightHelper.medium,
                                color: context.color.containerShadow2,
                                fontSize: 10.sp),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        if (state is Loading) {
          return Center(
              child: CircularProgressIndicator(
            color: context.color.greenLight,
          ));
        }
        return Center(child: SvgPicture.asset(AppAssets.pastOrders));
      },
    );
  }
}
