import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/di/dependency_injection.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';
import 'package:Parcelo/features/auth/login/presentation/components/log_in_bloc_listner.dart';
import 'package:Parcelo/features/auth/login/presentation/components/login_button.dart';
import 'package:Parcelo/features/auth/login/presentation/components/login_text_fields.dart';

import '../../../../../core/common/widgets/dark_and_lang_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(50.h),
              Image.asset(
                AppAssets.welcome,
                height: 250.h,
              ),
              // const LoginHeader(),
              verticalSpace(30),
              // const DarkAndLangButtons(),
              const LoginTextFields(),
              const LoginButton(),
              LogInBlocListner()
            ],
          ),
        ),
      ),
    );
  }
}
