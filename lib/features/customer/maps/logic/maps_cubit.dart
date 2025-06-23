import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Parcelo/features/customer/maps/logic/map_state.dart';
import 'package:geocoding/geocoding.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState.initial());
  static MapCubit get(context) => BlocProvider.of<MapCubit>(context);

  void setStartPoint(LatLng? point) {
    emit(state.copyWith(startPoint: point));
    _updateDistance();
  }

  Future<void> fetchCurrentLocationAndSet() async {
    final hasPermission = await _checkLocationPermission();
    if (!hasPermission) return;

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final currentLatLng = LatLng(position.latitude, position.longitude);

      String addressText = '';
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        addressText = [
          place.street,
          // place.locality,
          // place.administrativeArea,
          // place.country
        ].where((e) => e != null && e.isNotEmpty).join(', ');
        print(
            'place: ${place.street}:: ${place.locality} ::${place.administrativeArea}:: ${place.country}');
      }

      emit(state.copyWith(
        startPoint: currentLatLng,
        currentAddress: addressText,
      ));
    } catch (e) {
      print('Error getting location/address: $e');
    }
  }

  void setEndPoint(LatLng? point) {
    emit(state.copyWith(endPoint: point));
    _updateDistance();
  }

  Future<void> setInitialCameraLocation(GoogleMapController controller) async {
    final hasPermission = await _checkLocationPermission();
    if (!hasPermission) return;

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      ),
    ));
  }

  Future<bool> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    return permission != LocationPermission.deniedForever;
  }

  void _updateDistance() async {
    if (state.startPoint != null && state.endPoint != null) {
      final distanceInMeters = Geolocator.distanceBetween(
        state.startPoint!.latitude,
        state.startPoint!.longitude,
        state.endPoint!.latitude,
        state.endPoint!.longitude,
      );
      final distanceInKm = distanceInMeters / 1000;
      final cost = _calculateCost(distanceInKm);
      emit(state.copyWith(distanceInKm: distanceInKm, deliveryCost: cost));
    }
  }

  void resetValues() {
    emit(MapState(
      startPoint: null,
      endPoint: null,
      distanceInKm: 0,
      deliveryCost: 0,
    ));
  }

  double _calculateCost(double distanceInKm) {
    if (distanceInKm <= 50) {
      return 50;
    } else {
      final extra = ((distanceInKm - 50) / 50).ceil();
      return 50 + (extra * 30);
    }
  }
}
