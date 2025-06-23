import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/add_post_text_field.dart';
import 'package:Parcelo/core/common/widgets/custom_button.dart';
import 'package:Parcelo/core/common/widgets/custom_linear_button.dart';
import 'package:Parcelo/core/common/widgets/custom_text_field.dart';
import 'package:Parcelo/core/common/widgets/pick_up_details_text_field.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/constants/app_assets.dart';
import 'package:Parcelo/core/di/dependency_injection.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/post/logic/post_cubit.dart';
import 'package:Parcelo/features/customer/post/presentation/components/post_screen_body.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: Scaffold(
        backgroundColor: context.color.greenDark,
        body: Column(
          children: [
            Center(
              child: Text(
                context.translate(LangKeys.postScreen),
                style: context.textStyle.copyWith(
                  color: context.color.containerShadow2,
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
            verticalSpace(20.h),
            PostScreenBody()
          ],
        ),
      ),
    );
  }
}
