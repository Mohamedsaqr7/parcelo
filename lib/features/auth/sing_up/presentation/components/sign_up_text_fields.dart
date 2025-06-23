import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_text_field.dart';
import 'package:Parcelo/core/constants/app_regx.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/admin/user_management/logic/user_management_cubit.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        return current is! loading &&
            current is! success &&
            current is! failure;
      },
      builder: (context, state) {
        var cubit = SignUpCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomFadeInRight(
                duration: 400,
                child: CustomTextField(
                  controller: cubit.nameController,
                  hintText: context.translate(LangKeys.fullName),
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.color.containerLinear1,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 3) {
                      return context.translate(LangKeys.validName);
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              verticalSpace(15.h),
              CustomFadeInRight(
                duration: 600,
                child: CustomTextField(
                  controller: cubit.emailController,
                  hintText: context.translate(LangKeys.email),
                  prefixIcon: Icon(
                    Icons.email,
                    color: context.color.containerLinear1,
                  ),
                  keyboardType: TextInputType.emailAddress,
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
              verticalSpace(15.h),
              CustomFadeInRight(
                duration: 800,
                child: CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return context.translate(LangKeys.validPasswrod);
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: cubit.togglePass(context.color.containerLinear1),
                  obscureText: cubit.isSecured,
                  controller: cubit.passwordController,
                  hintText: context.translate(LangKeys.password),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: context.color.containerLinear1,
                  ),
                ),
              ),
              verticalSpace(15.h),
            ],
          ),
        );
      },
    );
  }
}
