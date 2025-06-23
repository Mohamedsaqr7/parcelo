import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/constants/app_regx.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';

import '../../../../../core/common/widgets/custom_text_field.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.r),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CustomFadeInLeft(
                  duration: 600,
                  child: CustomTextField(
                    hintText: context.translate(LangKeys.email),
                    prefixIcon: Icon(
                      Icons.email,
                      color: context.color.containerLinear1,
                    ),
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          AppRegex.isEmailValid(cubit.emailController.text)) {
                        return context.translate(LangKeys.validEmail);
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                verticalSpace(30),
                CustomFadeInLeft(
                  duration: 700,
                  child: CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return context.translate(LangKeys.validPasswrod);
                      } else {
                        return null;
                      }
                    },
                    suffixIcon:
                        cubit.togglePass(context.color.containerLinear1),
                    obscureText: cubit.isSecured,
                    controller: cubit.passwordController,
                    hintText: context.translate(LangKeys.password),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: context.color.containerLinear1,
                    ),
                  ),
                ),
                verticalSpace(30),
              ],
            ),
          ),
        );
      },
    );
  }
}
