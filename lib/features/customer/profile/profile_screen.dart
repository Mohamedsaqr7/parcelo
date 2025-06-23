import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/custom_button.dart';
import 'package:Parcelo/core/common/widgets/custom_dialog.dart';
import 'package:Parcelo/core/common/widgets/dark_and_lang_buttons.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';
import '../../../core/common/widgets/custom_container_linera_customer.dart';
import '../../../core/di/dependency_injection.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>()..getUserData(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LogSuccess) {
          context.pushReplacementNamed(AppRoutes.login);
        }
      }, builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return state.maybeWhen(
          getUserDataLoading: () {
            return Center(
              child: CircularProgressIndicator(
                color: context.color.greenLight,
              ),
            );
          },
          orElse: () {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundColor: context.color.greenLight,
                        backgroundImage: cubit.userModel?.imageUrl != null
                            ? NetworkImage(cubit.userModel!.imageUrl!)
                            : null,
                        child: cubit.userModel?.imageUrl == null
                            ? const Icon(Icons.person,
                                size: 40, color: Colors.white)
                            : null,
                      ),
                      verticalSpace(10.h),
                      TextApp(
                        text: cubit.userModel?.name ?? '',
                        theme: context.textStyle.copyWith(
                          color: context.color.textColor,
                          fontSize: 18.sp,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      verticalSpace(10.h),
                      TextApp(
                        text: cubit.userModel?.email ?? '',
                        theme: context.textStyle.copyWith(
                          color: context.color.textColor,
                          fontSize: 16.sp,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      verticalSpace(20.h),
                      profileThreeButtons(
                        onPressed: () async {
                          CustomDialog.twoButtonDialog(
                            context: context,
                            isLoading: false,
                            textBody: context.translate(LangKeys.logOutFromApp),
                            textButton1: context.translate(LangKeys.yes),
                            textButton2: context.translate(LangKeys.no),
                            onPressed: () {
                              context.read<LoginCubit>().signOut();

                              context.pop();
                            },
                          );
                        },
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
