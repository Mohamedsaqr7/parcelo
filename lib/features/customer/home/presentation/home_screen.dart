import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/home/logic/home_cubit.dart';
import 'package:Parcelo/features/customer/home/presentation/components/home_borders.dart';
import 'package:Parcelo/features/customer/home/presentation/components/home_main_container.dart';
import 'package:Parcelo/features/customer/home/presentation/components/search_body.dart';
import 'package:Parcelo/features/customer/home/presentation/components/user_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  verticalSpace(10.h),
                  UserLocation(),
                  verticalSpace(10.h),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: HomeMainContainer(),
                        ),
                        cubit.search.text.isEmpty
                            ? SliverToBoxAdapter(
                                child: HomeBorders(),
                              )
                            : SliverToBoxAdapter(
                                child: Padding(
                                padding: EdgeInsets.only(top: 10.0.h),
                                child: SearchBody(),
                              ))
                      ],
                    ),
                  ),
                  verticalSpace(20.h),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
