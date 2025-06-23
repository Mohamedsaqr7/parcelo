// lib/models/user_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') 
    required String id,
    required String email,
    @JsonKey(name: 'created_at')
    required String createdAt,
    required String name,
        @JsonKey(name: 'image') String? imageUrl, // ✅ صورة المستخدم

  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
