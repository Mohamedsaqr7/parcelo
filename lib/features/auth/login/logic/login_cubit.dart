import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Parcelo/core/constants/app_constants.dart';
import 'package:Parcelo/core/constants/secure_storage.dart';
import 'package:Parcelo/features/auth/login/data/login_repo.dart';
import 'package:Parcelo/features/auth/login/data/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginState.initial());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SupabaseClient client = Supabase.instance.client;
  LoginRepo repo;
  bool isSecured = true;

  Widget togglePass(Color? color) {
    return IconButton(
      onPressed: () {
        isSecured = !isSecured;
        emit(LoginState.TogglePassword(isSecured));
      },
      icon: isSecured
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: color,
    );
  }

  Future<void> login() async {
    emit(const LoginState.loading());
    try {
      await repo.login(
        emailController.text,
        passwordController.text,
      );
      print('current user: ${client.auth.currentUser!.id}');
      getUserData();
      emit(const LoginState.success());
    } on AuthException catch (e) {
      emit(LoginState.error(e.toString()));
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  UserModel? userModel;
  Future<void> getUserData() async {
    if (!isClosed) emit(LoginState.getUserDataLoading());
    try {
      final List<Map<String, dynamic>> data = await client
          .from(AppConstants.users)
          .select()
          .eq("user_id", client.auth.currentUser!.id);
      userModel = UserModel.fromJson(data[0]);

      emit(LoginState.getUserDataSuccess());
    } catch (e) {
      if (!isClosed) emit(LoginState.getUserDataError());
    }
  }

  Future<void> signOut() async {
    // emit(());
    emit(LoginState.logoutLoading());
    try {
      await client.auth.signOut();
      emit(LoginState.logoutSuccess());
    } catch (e) {
      // emit(LogoutError());
    }
  }
}
