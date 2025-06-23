// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/custom_container_linera_customer.dart';
import 'package:Parcelo/core/common/widgets/custom_home_container.dart';
import 'package:Parcelo/core/common/widgets/custom_linear_button.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/admin/order_management/logic/admin_cubit.dart';
import 'package:Parcelo/features/admin/order_management/presentation/widgets/order_details.dart';
import 'package:Parcelo/features/admin/order_management/presentation/widgets/order_state.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderItem extends StatelessWidget {
  OrderItem({super.key, required this.orders});
  final List<PostModel> orders;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      width: double.infinity,
      height: 600,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 15.w),
              decoration: BoxDecoration(
                  color: context.color.textColor2!.withOpacity(1),
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      AppAssets.parcel,
                      width: 150.w,
                      height: 150.h,
                    ),
                  ),
                  verticalSpace(10.h),
                  OrderDetails(orders: orders[index]),
                  verticalSpace(10),
                  OrderState(
                    orderId: orders[index].orderId,
                    currentState: orders[index].currentState,
                  ),
                  verticalSpace(50)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => verticalSpace(15),
          itemCount: orders.length),
    );
  }
}
