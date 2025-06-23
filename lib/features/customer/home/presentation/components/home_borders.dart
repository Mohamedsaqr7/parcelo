import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_home_container.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';

class HomeBorders extends StatelessWidget {
  const HomeBorders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20.h),
        CustomFadeInRight(
            duration: 650,
            child: CustomHomeContainer(
                image: AppAssets.fastDelivery,
                title: context.translate(LangKeys.orderDelivery),
                description: context.translate(LangKeys.orderDeliverydesc))),
        verticalSpace(10.h),
        CustomFadeInRight(
          duration: 700,
          child: CustomHomeContainer(
              image: AppAssets.deliveryBike,
              title: context.translate(LangKeys.trackDelivery),
              description: context.translate(LangKeys.trackDeliverydesc)),
        ),
        verticalSpace(10.h),
        CustomFadeInRight(
          duration: 750,
          child: CustomHomeContainer(
              image: AppAssets.parcel,
              title: context.translate(LangKeys.checkDelivery),
              description: context.translate(LangKeys.checkDeliverydesc)),
        ),
        verticalSpace(10.h),
      ],
    );
  }
}
