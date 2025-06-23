// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      orderId: json['order_id'] as String,
      distanceKM: (json['distance'] as num).toDouble(),
      currentState: (json['current_state'] as num).toInt(),
      pickUpAddress: json['pick_up_address'] as String,
      dropOffAddress: json['drop_off_address'] as String,
      pickUpName: json['pick_up_name'] as String,
      dropOffName: json['drop_off_name'] as String,
      pickUpPhone: json['pick_up_phone'] as String,
      dropOffPhone: json['drop_off_phone'] as String,
      price: json['total_price'] as String,
      userId: json['user_Id'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'pick_up_address': instance.pickUpAddress,
      'drop_off_address': instance.dropOffAddress,
      'pick_up_name': instance.pickUpName,
      'drop_off_name': instance.dropOffName,
      'pick_up_phone': instance.pickUpPhone,
      'drop_off_phone': instance.dropOffPhone,
      'total_price': instance.price,
      'user_Id': instance.userId,
      'current_state': instance.currentState,
      'order_id': instance.orderId,
      'distance': instance.distanceKM,
    };
