import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/features/customer/home/presentation/home_screen.dart';
import 'package:Parcelo/features/customer/main_screen/logic/nav_bar_cubit.dart';
import 'package:Parcelo/features/customer/orders/presentation/screen/orders_screen.dart';
import 'package:Parcelo/features/customer/post/presentation/screen/post_screen.dart';
import 'package:Parcelo/features/customer/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List<Widget> view = [
    const HomeScreen(),
    const PostScreen(),
    const OrdersScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          final cubit = context.read<NavBarCubit>();
          final currentIndex = state.currentIndex;
          return Scaffold(
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    color: context.color.textColor2!.withOpacity(0.4)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.h),
                  child: GNav(
                      onTabChange: (index) {
                        cubit.changeCurrentIndex(index);
                      },
                      rippleColor: context.color.greenDark!.withOpacity(
                          1), // tab button ripple color when pressed
                      hoverColor: context.color.mainColor!
                          .withOpacity(1), // tab button hover color
                      haptic: true, // haptic feedback
                      tabBorderRadius: 15,
                      tabActiveBorder: Border.all(
                          color: context.color.greenDark!.withOpacity(1),
                          width: 1), // tab button border
                      // tabBorder:
                      //     Border.all(color: Colors.grey, width: 1), // tab button border
                      // tab button shadow
                      curve: Curves.easeInExpo, // tab animation curves
                      duration:
                          Duration(milliseconds: 600), // tab animation duration
                      gap: 8, // the tab button gap between icon and text
                      color: context.color.textColor!
                          .withOpacity(1), // unselected icon color
                      activeColor: context.color.textColor2!
                          .withOpacity(1), // selected icon and text color
                      iconSize: 24, // tab button icon size
                      tabBackgroundColor: context.color.greenDark!
                          .withOpacity(1), // selected tab background color
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5), // navigation bar padding
                      tabs: [
                        GButton(
                          icon: Icons.home,
                          text: context.translate(LangKeys.home),
                        ),
                        GButton(
                          icon: Icons.post_add,
                          text: context.translate(LangKeys.delivery),
                        ),
                        GButton(
                          icon: Icons.shopping_bag,
                          text: context.translate(LangKeys.orders),
                        ),
                        GButton(
                          icon: Icons.person,
                          text: context.translate(LangKeys.profile),
                        )
                      ]),
                ),
              ),
              // backgroundColor: Colors.amber,
              body: SafeArea(child: view[currentIndex]));
        },
      ),
    );
  }
}
