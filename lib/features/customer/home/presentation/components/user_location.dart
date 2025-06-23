import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/features/customer/maps/logic/map_state.dart';
import 'package:Parcelo/features/customer/maps/logic/maps_cubit.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
        duration: 500,
        child: BlocProvider.value(
          value: MapCubit()..fetchCurrentLocationAndSet(),
          // create: (context) => MapCubit()..fetchCurrentLocationAndSet(),
          child: BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              var cubit = MapCubit.get(context);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,
                      color: context.color.textColor!.withOpacity(0.8),
                      size: 20.sp),
                  TextApp(
                    maxLines: 2,
                    text: state.currentAddress ?? 'جارٍ تحديد موقعك...',
                    theme: context.textStyle.copyWith(
                        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                        color: context.color.textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.bold),
                  )
                ],
              );
            },
          ),
        ));
  }
}
