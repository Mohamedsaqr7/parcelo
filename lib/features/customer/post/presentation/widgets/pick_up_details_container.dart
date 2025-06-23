import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/pick_up_details_text_field.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/post/logic/post_cubit.dart';
import 'package:Parcelo/features/customer/maps/presentation/map_screen.dart';

class PickUpDetailsContainer extends StatelessWidget {
  const PickUpDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(builder: (context, state) {
      var cubit = PostCubit.get(context);

      return Form(
        key: cubit.formKey1, // Ensure the form key is set
        child: CustomFadeInRight(
          duration: 500,
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: context.color.greenDark!),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: context.translate(LangKeys.pickUpDetails),
                  theme: context.textStyle.copyWith(
                    color: context.color.textColor,
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                verticalSpace(10.h),
                PickUpDetailsTextField(
                  readOnly: true,
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MapPickerScreen(
                            pickerType: MapPickerType.start),
                      ),
                    );

                    if (result != null && result is String) {
                      cubit.pickUpAddressController.text = result;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  hintText: context.translate(LangKeys.pickUpAddress),
                  controller: cubit.pickUpAddressController,
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: context.color.greenDark,
                  ),
                ),
                // PickUpDetailsTextField(
                //   readOnly: true,
                //   onTap: () async {
                //     final result = await Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (_) => const MapPickerScreen(
                //             pickerType: MapPickerType.start),
                //       ),
                //     );

                //     if (result != null && result is LatLng) {
                //       cubit.pickUpAddressController.text =
                //           "${result.latitude.toStringAsFixed(5)}, ${result.longitude.toStringAsFixed(5)}";
                //     }
                //   },
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'This field is required';
                //     }
                //     return null;
                //   },
                //   hintText: context.translate(LangKeys.pickUpAddress) ??
                //       'Enter pick-up address',
                //   controller: cubit.pickUpAddressController,
                //   prefixIcon:
                //       Icon(Icons.location_on, color: context.color.greenDark),
                // ),

                verticalSpace(10.h),
                PickUpDetailsTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  hintText: context.translate(LangKeys.pickUpName),
                  controller: cubit.pickUpNameController,
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.color.greenDark,
                  ),
                ),
                verticalSpace(10.h),
                PickUpDetailsTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  hintText: context.translate(LangKeys.pickUpPhone),
                  controller: cubit.pickUpPhoneController,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: context.color.greenDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
