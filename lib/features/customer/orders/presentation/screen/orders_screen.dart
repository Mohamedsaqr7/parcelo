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
import 'package:Parcelo/features/customer/orders/presentation/components/order_screen_header.dart';
import 'package:Parcelo/features/customer/orders/presentation/widgets/current_order_body.dart';
import 'package:Parcelo/features/customer/orders/presentation/widgets/past_order_body.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: OrdersCubit()..fetchUserOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          var cubit = OrdersCubit.get(context);
          return Scaffold(
            backgroundColor: context.color.greenDark,
            body: Column(
              children: [
                Center(
                  child: Text(
                    context.translate(LangKeys.orderScreen),
                    style: context.textStyle.copyWith(
                      color: context.color.containerShadow2,
                      fontSize: 20.sp,
                      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
                verticalSpace(20.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.color.textColor2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0.r),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(20.h),
                            OrderScreenHeader(),
                            verticalSpace(20.h),
                            cubit.current
                                ? CurrentOrderBody()
                                : PastOrderBody(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
