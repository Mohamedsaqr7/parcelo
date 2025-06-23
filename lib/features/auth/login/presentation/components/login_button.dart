import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_linear_button.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.r),
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 400,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return CustomLinearButton(
                  width: double.infinity,
                  height: 50,
                  onPressed: () {
                    validateThenDoLogIn(context);
                  },
                  child: TextApp(
                      text: context.translate(LangKeys.login),
                      theme: context.textStyle.copyWith(
                          color: context.color.containerShadow2,
                          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.bold)),
                );
              },
            ),
          ),
          // verticalSpace(5),
          CustomFadeInLeft(
            duration: 800,
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // context.pushName(AppRoutes.forgotPassword);
                },
                child: Text(
                  context.translate(LangKeys.forgotPassword),
                  style: context.textStyle.copyWith(
                      fontSize: 16.sp, color: context.color.greenLight),
                ),
              ),
            ),
          ),
          CustomFadeInUp(
              duration: 600,
              child: TextButton(
                onPressed: () {
                  context.pushName(AppRoutes.signUp);
                },
                child: RichText(
                  text: TextSpan(
                    text: context.translate(LangKeys.createAccount),
                    style: context.textStyle.copyWith(
                        fontSize: 16.sp, color: context.color.greenLight),
                    children: [
                      TextSpan(
                        text: context.translate(LangKeys.signUp),
                        style: context.textStyle.copyWith(
                            fontWeight: FontWeightHelper.extraBold,
                            fontSize: 16.sp,
                            fontFamily:
                                FontFamilyHelper.geLocalozedFontFamily(),
                            color: context.color.greenDark),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void validateThenDoLogIn(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
