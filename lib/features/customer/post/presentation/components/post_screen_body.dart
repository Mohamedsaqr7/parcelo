import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/post/presentation/widgets/drop_off_details_container.dart';
import 'package:Parcelo/features/customer/post/presentation/widgets/pick_up_details_container.dart';
import 'package:Parcelo/features/customer/post/presentation/widgets/place_order_container.dart';
import 'package:Parcelo/features/customer/post/presentation/widgets/post_add_location.dart';

class PostScreenBody extends StatelessWidget {
  const PostScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                CustomFadeInDown(
                  duration: 400,
                  child: Center(
                    child: Image.asset(AppAssets.deliveryMan,
                        width: 120.w, height: 150.h),
                  ),
                ),
                // PostAddLocation(),
                verticalSpace(30.h),
                PickUpDetailsContainer(),
                verticalSpace(10),
                DropOffDetailsContainer(),
                verticalSpace(20.h),
                PlaceOrderContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
