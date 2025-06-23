import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Parcelo/core/common/widgets/add_post_text_field.dart';
import 'package:Parcelo/core/common/widgets/custom_button.dart';
import 'package:Parcelo/core/common/widgets/text_app.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/style/fonts/font_family.dart';
import 'package:Parcelo/core/style/fonts/font_weight.dart';
import 'package:Parcelo/core/style/theme/spacing.dart';
import 'package:Parcelo/features/customer/post/logic/post_cubit.dart';

class PostAddLocation extends StatelessWidget {
  const PostAddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(builder: (context, state) {
      var cubit = PostCubit.get(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: 'Add Location',
            theme: context.textStyle.copyWith(
              color: context.color.textColor,
              fontSize: 20.sp,
              fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          verticalSpace(10),
          AddPostTextField(
              controller: cubit.pickUpAddressController,
              title: 'Pick Up',
              hintText: 'Enter pick up location here'),
          verticalSpace(10),
          AddPostTextField(
              controller: cubit.dropOffAddressController,
              title: 'DropOff',
              hintText: 'Enter drop off location here'),
          verticalSpace(10),
          CustomButton(
              backgroundColor: context.color.greenDark,
              onPressed: () {},
              text: 'Submit Location',
              width: 200,
              height: 40)
        ],
      );
    });
  }
}
