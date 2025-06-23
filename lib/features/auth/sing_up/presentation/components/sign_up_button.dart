import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Parcelo/core/common/widgets/animate_do.dart';
import 'package:Parcelo/core/common/widgets/custom_linear_button.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.imageFile});
  final File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInRight(
          duration: 900,
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomLinearButton(
                width: double.infinity,
                height: 50,
                onPressed: () {
                  validateThenDoSignUP(context);
                },
                child: TextApp(
                    text: context.translate(LangKeys.signUp),
                    theme: context.textStyle.copyWith(
                        color: context.color.containerShadow2,
                        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.bold)),
              );
            },
          ),
        ),
        verticalSpace(20),
        CustomFadeInDown(
            duration: 800,
            child: TextButton(
              onPressed: () {
                context.pushName(AppRoutes.login);
              },
              child: RichText(
                text: TextSpan(
                  text: context.translate(LangKeys.youHaveAccount),
                  style: context.textStyle.copyWith(
                      fontSize: 16.sp, color: context.color.greenLight),
                  children: [
                    TextSpan(
                      text: context.translate(LangKeys.login),
                      style: context.textStyle.copyWith(
                          fontWeight: FontWeightHelper.extraBold,
                          fontSize: 16.sp,
                          color: context.color.greenDark),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  void validateThenDoSignUP(BuildContext context) {
    if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى اختيار صورة أولًا")),
      );
      return;
    }

    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp(
          image: imageFile!,
          email: context.read<SignUpCubit>().emailController.text.trim(),
          password: context.read<SignUpCubit>().passwordController.text.trim(),
          name: context.read<SignUpCubit>().nameController.text.trim());
    }
  }
}
