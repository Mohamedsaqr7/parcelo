import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/orders/logic/orders_cubit.dart';
import 'package:Parcelo/features/customer/orders/presentation/widgets/selected_current_order.dart';
import 'package:Parcelo/features/customer/orders/presentation/widgets/selected_past_order.dart';
import 'package:Parcelo/features/customer/orders/presentation/widgets/unselected_current_order.dart';
import 'package:Parcelo/features/customer/orders/presentation/widgets/unselected_past_order.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderScreenHeader extends StatelessWidget {
  const OrderScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        var cubit = OrdersCubit.get(context);
        return CustomFadeInDown(
          duration: 450,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              cubit.current ? SelectedCurrentOrder() : UnselectedCurrentOrder(),
              cubit.past ? SelectedPastOrder() : UnselectedPastOrder(),
            ],
          ),
        );
      },
    );
  }
}
