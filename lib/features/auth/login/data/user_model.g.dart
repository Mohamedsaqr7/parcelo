// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['user_id'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] as String,
      name: json['name'] as String,
      imageUrl: json['image'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'email': instance.email,
      'created_at': instance.createdAt,
      'name': instance.name,
      'image': instance.imageUrl,
    };
