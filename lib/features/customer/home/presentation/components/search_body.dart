import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Parcelo/features/customer/home/logic/home_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is Loading) {
          return Center(
              child: CircularProgressIndicator(
            color: context.color.greenLight,
          ));
        } else if (state is SingleOrderLoaded) {
          final order = state.order;

          return Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.color.containerShadow1!.withOpacity(0.01),
                    offset: const Offset(1, 2),
                    // blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: context.color.containerLinear2!)),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: context.color.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.regular,
                  fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                ),
                children: [
                  TextSpan(
                    text: '${context.translate(LangKeys.dropOffDetails)}: \n',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                  TextSpan(
                      text: '${context.translate(LangKeys.location)}: ',
                      style: TextStyle(
                          fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
                  TextSpan(
                    text: order.dropOffAddress + '\n',
                  ),
                  TextSpan(
                      text: '${context.translate(LangKeys.name)}: ',
                      style: TextStyle(
                          fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
                  TextSpan(
                    text: order.dropOffName + '\n',
                  ),
                  TextSpan(
                      text: '${context.translate(LangKeys.phone)}: ',
                      style: TextStyle(
                          fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
                  TextSpan(
                    text: order.dropOffPhone + '\n',
                  ),
                  TextSpan(
                      text: '${context.translate(LangKeys.price)}: ',
                      style: TextStyle(
                          fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
                  TextSpan(
                      text: order.price +
                          " ${context.translate(LangKeys.pound)}" +
                          '\n'),
                  TextSpan(
                      text: '${context.translate(LangKeys.distance)}: ',
                      style: TextStyle(
                          fontWeight: FontWeightHelper.bold, fontSize: 16.sp)),
                  TextSpan(
                      text: " ${order.distanceKM} " +
                          " ${context.translate(LangKeys.KM)}"),
                ],
              ),
            ),
          );
        } else if (state is Error) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return SizedBox.shrink(); // لو مفيش حاجة
        }
      },
    );
  }
}
