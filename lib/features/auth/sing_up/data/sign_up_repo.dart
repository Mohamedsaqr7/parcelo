import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpRepo {
  SignUpRepo(this.client);
  SupabaseClient client = Supabase.instance.client;
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user == null) throw Exception("Signup failed");
    } on AuthException catch (e) {
      if (e.statusCode == 422 &&
          e.message.contains('User already registered')) {
        throw Exception("البريد الإلكتروني مستخدم بالفعل");
      }
      rethrow;
    }
  }

  Future<String?> uploadImageToSupabase(File? image) async {
    // final bytes = await image.readAsBytes();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName'; // مسار التخزين في Supabase
    // final response = await Supabase.instance.client.storage
    //     .from('userprofiles') // تأكد إن عندك bucket اسمه كده
    //     .uploadBinary(fileName, bytes);
    if (image != null) {
      final url = Supabase.instance.client.storage
          .from('userprofiles')
          .upload(path, image);
      final imageUrl = Supabase.instance.client.storage
          .from('userprofiles')
          .getPublicUrl(path);
      return imageUrl;
    }

    return null;
  }
}
