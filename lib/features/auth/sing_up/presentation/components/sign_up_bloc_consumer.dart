import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Parcelo/core/common/widgets/show_toast.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/routes/app_routes.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';

class SignUpBlocListner extends StatelessWidget {
  const SignUpBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is failure || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {},
          success: () {
            ShowToast.showSuccessToast(
                context.translate(LangKeys.signUpSuccess));
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                context.pushName(AppRoutes.login);
              },
            );
          },
          error: (error) {
            // ShowToast.showFailureToast(state. ?? '');
            setupErrorState(context, error ?? '');
          },
        );
      },
      child: SizedBox.shrink(),
    );
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
}
