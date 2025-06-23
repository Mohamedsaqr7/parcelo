// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Parcelo/core/di/dependency_injection.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';
import 'package:Parcelo/features/auth/sing_up/presentation/components/sign_up_button.dart';

import '../components/pick_image.dart';
import '../components/sign_up_bloc_consumer.dart';
import '../components/sign_up_text_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile image
                PickImageWidget(
                  onImagePicked: (file) {
                    imageFile = file != null ? File(file.path) : null;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 24),
                // Name
                SignUpTextFields(),
                SignUpButton(
                  imageFile: imageFile,
                ),
                SignUpBlocListner()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
