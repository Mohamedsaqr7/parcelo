import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Parcelo/core/constants/app_constants.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:math';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState.initial());
  static PostCubit get(context) => BlocProvider.of<PostCubit>(context);

  // final PostRepo repo;
  final pickUpAddressController = TextEditingController();
  final dropOffAddressController = TextEditingController();
  final pickUpNameController = TextEditingController();
  final dropOffNameController = TextEditingController();
  final pickUpPhoneController = TextEditingController();
  final dropOffPhoneController = TextEditingController();
  final userId = Supabase.instance.client.auth.currentUser!.id;
  SupabaseClient client = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  static String get randomStringId {
    const chars =
        'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random.secure();

    final codes = List<int>.generate(
        5, (index) => chars.codeUnitAt(random.nextInt(chars.length)));

    return String.fromCharCodes(codes);
  }

  Future<void> addPost({String? priceController, double? distance}) async {
    emit(PostState.loading());
    try {
      print('💥 Reached Cubit.addPost');

      await client.from(AppConstants.addOrder).insert(
            PostModel(
              distanceKM: distance ?? 0.0,
              orderId: randomStringId,
              dropOffAddress: dropOffAddressController.text,
              dropOffName: dropOffNameController.text,
              dropOffPhone: dropOffPhoneController.text,
              pickUpAddress: pickUpAddressController.text,
              pickUpName: pickUpNameController.text,
              pickUpPhone: pickUpPhoneController.text,
              price: priceController ?? '80',
              currentState: -1,
              userId: userId,
            ),
          );
      emit(PostState.success());
      print('✅ Order added successfully');
    } catch (e) {
      print('❌ order add failed: $e');
      if (e.toString().contains("JWT expired")) {
        final res = await Supabase.instance.client.auth.refreshSession();
        final session = res.session;
        emit(PostState.error(e.toString()));
      }

      @override
      Future<void> close() {
        pickUpAddressController.dispose();
        dropOffAddressController.dispose();
        pickUpNameController.dispose();
        dropOffNameController.dispose();
        pickUpPhoneController.dispose();
        dropOffPhoneController.dispose();
        return super.close();
      }
    }
  }

  Future<void> clear() {
    pickUpAddressController.clear();
    dropOffAddressController.clear();
    pickUpNameController.clear();
    dropOffNameController.clear();
    pickUpPhoneController.clear();
    dropOffPhoneController.clear();
    return super.close();
  }
}
