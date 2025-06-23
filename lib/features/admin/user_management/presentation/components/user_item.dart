import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/custom_button.dart';
import 'package:Parcelo/core/common/widgets/custom_dialog.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/admin/user_management/logic/user_management_cubit.dart';
import 'package:Parcelo/features/auth/login/data/user_model.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.users});
  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(30.r),
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: context.color.greenDark!.withOpacity(0.8),
                        width: 1),
                    color: context.color.mainColor,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: context.color.containerLinear2!
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: users[index].imageUrl == null
                                    ? Image.asset(AppAssets.admin,
                                        height: 100.h, width: 100.w)
                                    : Image.network(
                                        users[index].imageUrl!,
                                        height: 100.h,
                                        width: 100.w,
                                        fit: BoxFit.cover,
                                      ))),
                        horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: users[index].name ?? "Manage all users",
                              theme: context.textStyle.copyWith(
                                  color: context.color.textColor,
                                  fontFamily:
                                      FontFamilyHelper.geLocalozedFontFamily(),
                                  fontSize: 17.sp,
                                  fontWeight: FontWeightHelper.semiBold),
                            ),
                            verticalSpace(10),
                            TextApp(
                              text: users[index].email ?? "Manage all users",
                              theme: context.textStyle.copyWith(
                                  color: context.color.textColor,
                                  fontFamily:
                                      FontFamilyHelper.geLocalozedFontFamily(),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeightHelper.medium),
                            ),
                            verticalSpace(10),
                            CustomButton(
                                onPressed: () {
                                  CustomDialog.twoButtonDialog(
                                    context: context,
                                    isLoading: false,
                                    textBody:
                                        context.translate(LangKeys.deleteUser),
                                    textButton1:
                                        context.translate(LangKeys.yes),
                                    textButton2: context.translate(LangKeys.no),
                                    onPressed: () {
                                      UserManagementCubit.get(context)
                                          .deleteUser(users[index].id);
                                      context.pop();
                                    },
                                  );
                                },
                                text: 'Remove',
                                width: 130.w,
                                height: 35.h),
                            // verticalSpace(10),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => verticalSpace(15.h),
            itemCount: users.length));
  }
}
