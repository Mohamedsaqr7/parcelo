import 'package:get_it/get_it.dart';
import 'package:Parcelo/core/app/app_cubit/app_cubit.dart';
import 'package:Parcelo/core/app/observer.dart';
import 'package:Parcelo/features/auth/login/data/login_repo.dart';
import 'package:Parcelo/features/auth/login/logic/login_cubit.dart';
import 'package:Parcelo/features/auth/sing_up/data/sign_up_repo.dart';
import 'package:Parcelo/features/auth/sing_up/logic/sign_up_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
Future<void> setupInjection() async {
  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );
  getIt
    ..registerFactory<AppCubit>(() => AppCubit())
    ..registerLazySingleton<MyBlocObserver>(() => MyBlocObserver())
    ..registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()))
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt()))
    ..registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()))
    ..registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  // ..registerLazySingleton<PostRepo>(() => PostRepo(getIt()))
  // ..registerFactory<PostCubit>(() => PostCubit(getIt()));
}
