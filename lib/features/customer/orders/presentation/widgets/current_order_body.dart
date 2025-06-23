import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/orders/logic/orders_cubit.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CurrentOrderBody extends StatelessWidget {
  CurrentOrderBody({super.key});
  // PostModel? order;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        // state
        if (state is Success && state.currentOrders.isNotEmpty) {
          final order = state.currentOrders.first;
          var cubit = OrdersCubit.get(context);
          return CustomFadeInUp(
            duration: 550,
            child: Container(
              decoration: BoxDecoration(
                  color: context.color.containerLinear2!.withOpacity(0.1),
                  border: Border.all(
                      width: 0.7, color: context.color.containerLinear2!),
                  borderRadius: BorderRadius.circular(15.r)),
              height: 460.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: context.color.greenLight,
                      ),
                      TextApp(
                        text: context.translate(LangKeys.ourMarket),
                        theme: context.textStyle.copyWith(
                          color: context.color.textColor,
                          fontSize: 16.sp,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(AppAssets.parcel,
                          width: 100.w, height: 100.h),
                      horizontalSpace(5),
                      Expanded(
                        child: SizedBox(
                          height: 410.h,
                          child: Timeline.tileBuilder(
                            builder: TimelineTileBuilder.connected(
                              itemCount: 5,
                              connectionDirection: ConnectionDirection.before,
                              contentsAlign: ContentsAlign.alternating,
                              contentsBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 12.w),
                                  child: Text(
                                    cubit.getOrderStatus(index, context),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: context.color.textColor,
                                      fontWeight: FontWeightHelper.semiBold,
                                    ),
                                  ),
                                );
                              },
                              indicatorBuilder: (context, index) {
                                if (order.currentState >= index) {
                                  return DotIndicator(
                                    color: context.color.greenLight,
                                    child: Icon(Icons.check_rounded,
                                        color: context.color.textColor2,
                                        size: 24.sp),
                                  );
                                } else {
                                  return OutlinedDotIndicator(
                                    borderWidth: 3,
                                    size: 20.sp,
                                  );
                                }
                              },
                              connectorBuilder: (_, index, __) {
                                return SolidLineConnector(
                                  thickness: 2, // ✅ مهم لظهور الخط

                                  color: index <= order.currentState
                                      ? context.color.greenLight!
                                      : context.color.containerLinear2!,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state is Success && state.currentOrders.isEmpty) {
          return Center(
            child: Image.asset(
              AppAssets.orderNow,
              height: 200,
              fit: BoxFit.fill,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: context.color.greenLight,
            ),
          );
        }
      },
    );
  }
}
