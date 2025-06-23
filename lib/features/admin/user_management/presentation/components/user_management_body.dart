import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/custom_button.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/admin/user_management/logic/user_management_cubit.dart';
import 'package:Parcelo/features/admin/user_management/presentation/components/user_item.dart';

class UserManagementBody extends StatelessWidget {
  const UserManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_new,
                    color: context.color.containerShadow2)),
            Spacer(),
            Text(
              textAlign: TextAlign.center,
              'All Users',
              style: context.textStyle.copyWith(
                color: context.color.containerShadow2,
                fontSize: 20.sp,
                fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            Spacer()
          ],
        ),
        verticalSpace(10.h),
        Expanded(
            child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.color.textColor2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: BlocBuilder<UserManagementCubit, UserManagementState>(
            builder: (context, state) {
              if (state is loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: context.color.greenDark,
                  ),
                );
              } else if (state is Error) {
                return Center(
                  child: TextApp(
                    text: state.error.toString(),
                    theme: context.textStyle.copyWith(
                      color: context.color.textColor,
                      fontSize: 16.sp,
                      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                );
              } else if (state is success) {
                final users = state.users;
                return UserItem(
                  users: users,
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ))
      ],
    );
  }
}
