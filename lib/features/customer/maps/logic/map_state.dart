import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final LatLng? startPoint;
  final LatLng? endPoint;
  final double? distanceInKm;
  final double? deliveryCost;
  final String? currentAddress;

  MapState({
    this.startPoint,
    this.endPoint,
    this.distanceInKm,
    this.deliveryCost,
    this.currentAddress,
  });

  factory MapState.initial() => MapState();

  MapState copyWith({
    LatLng? startPoint,
    LatLng? endPoint,
    double? distanceInKm,
    double? deliveryCost,
    String? currentAddress,
  }) {
    return MapState(
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      distanceInKm: distanceInKm ?? this.distanceInKm,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      currentAddress: currentAddress ?? this.currentAddress,
    );
  }
}
