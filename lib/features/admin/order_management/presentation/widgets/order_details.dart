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
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.orders});
  final PostModel orders;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: context.color.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.regular,
          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
        ),
        children: [
          TextSpan(
            text: 'Drop-Off Details:\n',
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          const TextSpan(text: 'Address: '),
          TextSpan(
            text: orders.dropOffAddress + '\n',
          ),
          const TextSpan(text: 'Name: '),
          TextSpan(
            text: orders.dropOffName + '\n',
          ),
          const TextSpan(text: 'Phone: '),
          TextSpan(
            text: orders.dropOffPhone + '\n',
          ),
          TextSpan(
            text: 'PickUp Details:\n',
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          const TextSpan(text: 'Address: '),
          TextSpan(
            text: orders.pickUpAddress + '\n',
          ),
          const TextSpan(text: 'Name: '),
          TextSpan(
            text: orders.pickUpName + '\n',
            style: TextStyle(fontWeight: FontWeightHelper.regular),
          ),
          const TextSpan(text: 'Phone: '),
          TextSpan(
            text: orders.pickUpPhone + '\n',
          ),
          TextSpan(
              text: 'Price: ',
              style: TextStyle(
                  fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
          TextSpan(
            text: orders.price + " EGP" + '\n',
          ),
          TextSpan(
              text: 'Distance: ',
              style: TextStyle(
                  fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
          TextSpan(
            text: "${orders.distanceKM}" + " KM" + '\n',
          ),
        ],
      ),
    );
  }
}
