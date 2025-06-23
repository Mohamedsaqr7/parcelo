import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Parcelo/core/common/widgets/show_toast.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';

class LogInBlocListner extends StatelessWidget {
  const LogInBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Failure || current is Success,
      listener: (context, state) {
        var cubit = LoginCubit.get(context);
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: context.color.greenLight,
                ),
              ),
            );
          },
          success: () {
            context.pop();
            ShowToast.showSuccessToast(
                context.translate(LangKeys.loggedSuccessfully));
            if (cubit.emailController.text == 'admin11@gmail.com' &&
                cubit.passwordController.text == '123456admin') {
              context.pushReplacementNamed(AppRoutes.adminMainScreen);
            } else {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  context.pushReplacementNamed(AppRoutes.mainScreen);
                },
              );
            }
          },
          error: (error) {
            context.pop();
            // ShowToast.showFailureToast(error.toString() ?? 'failed');
            setupErrorState(context, error ?? "");
            print('$error');
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String errorr) {
  // context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        errorr,
        // style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            // style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
