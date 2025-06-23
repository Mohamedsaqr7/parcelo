import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/custom_linear_button.dart';
import 'package:Parcelo/core/common/widgets/pick_up_details_text_field.dart';
import 'package:Parcelo/core/common/widgets/show_toast.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/main_screen/presentation/main_screen.dart';
import 'package:Parcelo/features/customer/maps/logic/map_state.dart';
import 'package:Parcelo/features/customer/maps/logic/maps_cubit.dart';
import 'package:Parcelo/features/customer/post/data/paymob_manager.dart';
import 'package:Parcelo/features/customer/post/logic/post_cubit.dart';
import 'package:Parcelo/features/customer/post/presentation/widgets/payment.dart';

class PlaceOrderContainer extends StatelessWidget {
  const PlaceOrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: context.color.greenDark!),
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                      text:
                          "${context.translate(LangKeys.totalPrice)} :  ${state.deliveryCost?.toStringAsFixed(0) ?? 0.0} ${context.translate(LangKeys.pound)}",
                      theme: context.textStyle.copyWith(
                        color: context.color.textColor,
                        fontSize: 16.sp,
                        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    verticalSpace(5.h),
                    TextApp(
                      text:
                          '${context.translate(LangKeys.distance)} ${state.distanceInKm?.toStringAsFixed(2) ?? 0} ${context.translate(LangKeys.KM)}',
                      theme: context.textStyle.copyWith(
                        color: context.color.textColor,
                        fontSize: 15.sp,
                        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                var cubit = PostCubit.get(context);
                var mapCubit = MapCubit.get(context);
                return CustomLinearButton(
                    height: 50.h,
                    width: 150,
                    onPressed: () async {
                      final paymentKey = await PaymobManager()
                          .payWithPaymob(mapCubit.state.deliveryCost!.toInt());

                      // final result = await Navigator.push<bool>(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PaymobWebViewScreen(
                      //       paymentToken: paymentKey,
                      //       distance: mapCubit.state.distanceInKm!,
                      //       price: mapCubit.state.deliveryCost.toString(),
                      //     ),
                      //   ),
                      // );

                      // if (result == true) {
                      //   await cubit.addPost(
                      //     distance: mapCubit.state.distanceInKm!,w
                      //     priceController:
                      //         mapCubit.state.deliveryCost.toString(),
                      //   );
                      //   mapCubit.setStartPoint(null);
                      //   mapCubit.setEndPoint(null);
                      //   mapCubit.resetValues();
                      //   cubit.clear();
                      //   ShowToast.showSuccessToast('Order placed successfully');
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(builder: (_) => MainScreen()),
                      //   );
                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                  value: context.read<PostCubit>()),
                              BlocProvider.value(
                                  value: context.read<MapCubit>()),
                            ],
                            child: PaymobWebViewScreen(
                              paymentToken: paymentKey,
                              distance: mapCubit.state.distanceInKm!,
                              price: mapCubit.state.deliveryCost.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                    child: TextApp(
                      text: context.translate(LangKeys.placeOrder),
                      theme: context.textStyle.copyWith(
                          color: context.color.containerShadow2,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.bold),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
