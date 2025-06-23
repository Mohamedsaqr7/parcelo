import 'package:json_annotation/json_annotation.dart';

part 'post_order_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(name: 'pick_up_address')
  final String pickUpAddress;
  @JsonKey(name: 'drop_off_address')
  final String dropOffAddress;
  @JsonKey(name: 'pick_up_name')
  final String pickUpName;
  @JsonKey(name: 'drop_off_name')
  final String dropOffName;
  @JsonKey(name: 'pick_up_phone')
  final String pickUpPhone;
  @JsonKey(name: 'drop_off_phone')
  final String dropOffPhone;
  @JsonKey(name: 'total_price')
  final String price;
  @JsonKey(name: 'user_Id')
  final String userId;
  @JsonKey(name: 'current_state')
  final int currentState;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'distance')
  final double distanceKM;
  PostModel(
    {
   required this.orderId,
   required this.distanceKM,
    required this.currentState,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.pickUpName,
    required this.dropOffName,
    required this.pickUpPhone,
    required this.dropOffPhone,
    required this.price,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
