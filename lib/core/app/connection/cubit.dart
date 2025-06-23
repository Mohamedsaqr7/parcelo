// lib/core/app/connection/connection_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum ConnectionStatus { connected, disconnected }

class ConnectionCubit extends Cubit<ConnectionStatus> {
  ConnectionCubit() : super(ConnectionStatus.connected) {
    InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        emit(ConnectionStatus.connected);
      } else {
        emit(ConnectionStatus.disconnected);
      }
    });
  }
}
