import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Parcelo/core/constants/app_constants.dart';
import 'package:Parcelo/features/auth/sing_up/data/sign_up_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repo) : super(SignUpState.initial());
  static SignUpCubit get(context) => BlocProvider.of<SignUpCubit>(context);
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  SignUpRepo repo;
  bool isSecured = true;

  Widget togglePass(Color? color) {
    return IconButton(
      onPressed: () {
        isSecured = !isSecured;
        emit(SignUpState.TogglePassword(isSecured));
      },
      icon: isSecured
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: color,
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    emit(const SignUpState.loading());
    try {
      await repo.signUp(
        email: email,
        password: password,
      );
      final imageUrl = await repo.uploadImageToSupabase(image);
      if (imageUrl == null) throw Exception("Image upload failed");

      await addUserData(email: email, name: name, image: imageUrl);
      emit(const SignUpState.success());
    } on AuthException catch (e) {
      emit(SignUpState.error(e.message));
    } catch (e) {
      emit(SignUpState.error(e.toString()));
    }
  }

  Future<void> addUserData({
    required String name,
    required String email,
    required String image,
  }) async {
    if (!isClosed) emit(SignUpState.adduserloading());
    try {
      await client.from(AppConstants.users).upsert({
        "user_id": client.auth.currentUser!.id,
        "name": name,
        "email": email,
        "image": image
      });
      if (!isClosed) emit(SignUpState.addusersuccess());
    } catch (e) {
      if (!isClosed) emit(SignUpState.addusererror(e.toString()));
    }
  }

  SupabaseClient client = Supabase.instance.client;
}
