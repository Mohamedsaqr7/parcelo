// // ignore_for_file: unused_import

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
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';

class OrderState extends StatefulWidget {
  const OrderState(
      {super.key, required this.orderId, required this.currentState});
  final String orderId;
  final int currentState;
  @override
  State<OrderState> createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {
  final List<String> statusList = [
    'Driver on the way to pickup point',
    'Driver has arrived to pickup piont',
    'parcel collected',
    'Driver on the way to delivery destination',
    'parcel Delivered',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
        return Column(
          children: [
            _buildButton(context, cubit, 0),
            verticalSpace(10),
            _buildButton(context, cubit, 1),
            verticalSpace(10),
            _buildButton(context, cubit, 2),
            verticalSpace(10),
            _buildButton(context, cubit, 3),
            verticalSpace(10),
            _buildButton(context, cubit, 4),
          ],
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, AdminCubit cubit, int index) {
    bool isSelected = widget.currentState == index;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLinearButton(
            onPressed: () async {
              await cubit.updateOrderState(index, widget.orderId);
            },
            child: TextApp(
              text: statusList[index],
              textAlign: TextAlign.center,
              theme: context.textStyle.copyWith(
                fontWeight: FontWeightHelper.medium,
                fontSize: 14.sp,
                fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                color: context.color.containerShadow2,
              ),
            ),
            height: 50.h,
            width: 250.w,
          ),
          if (isSelected) ...[
            SizedBox(width: 5),
            Icon(Icons.check_box_rounded,
                color: context.color.greenDark, size: 30.sp),
          ],
        ],
      ),
    );
  }
}
