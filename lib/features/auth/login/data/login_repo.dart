import 'package:Parcelo/features/auth/login/data/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepo {
  LoginRepo(this.client);
  SupabaseClient client = Supabase.instance.client;
  Future<UserModel> login(String email, String password) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) throw Exception("Login failed");

    return UserModel(
        id: user.id,
        email: user.email ?? '',
        createdAt: user.createdAt,
        name: user.userMetadata?['name'] ?? '');
  }

  Future<void> logout() async {
    await client.auth.signOut();
  }
}
