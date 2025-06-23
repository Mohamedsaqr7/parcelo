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
import 'package:Parcelo/features/admin/order_management/presentation/components/order_item.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderManagementBody extends StatelessWidget {
  const OrderManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_new,
                    color: context.color.containerShadow2)),
            Spacer(),
            Text(
              textAlign: TextAlign.center,
              'All orders',
              style: context.textStyle.copyWith(
                color: context.color.containerShadow2,
                fontSize: 20.sp,
                fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            Spacer()
          ],
        ),
        verticalSpace(10.h),
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
              padding: const EdgeInsets.all(10.0),
              child: BlocBuilder<AdminCubit, AdminState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: context.color.greenLight,
                    ));
                  } else if (state is Error) {
                    return Center(child: Text("Error: ${state.error}"));
                  } else if (state is Success) {
                    final orders = state.orders;
                    return OrderItem(orders: orders);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
