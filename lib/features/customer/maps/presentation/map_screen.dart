import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/features/customer/maps/logic/map_state.dart';
import 'package:Parcelo/features/customer/maps/logic/maps_cubit.dart';

/// Enum to determine whether we're selecting the start or end point
enum MapPickerType { start, end }

class MapPickerScreen extends StatefulWidget {
  final MapPickerType pickerType;

  const MapPickerScreen({super.key, required this.pickerType});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.greenLight,
      ),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(30.033333, 31.233334),
                  zoom: 14,
                ),
                onMapCreated: (controller) {
                  _mapController = controller;
                  context.read<MapCubit>().setInitialCameraLocation(controller);
                },
                markers: {
                  if (state.startPoint != null)
                    Marker(
                      markerId: const MarkerId('start'),
                      position: state.startPoint!,
                      infoWindow: const InfoWindow(title: 'نقطة الانطلاق'),
                    ),
                  if (state.endPoint != null)
                    Marker(
                      markerId: const MarkerId('end'),
                      position: state.endPoint!,
                      infoWindow: const InfoWindow(title: 'نقطة الوصول'),
                    ),
                },
                //           onTap: (LatLng position) async {
                //   if (widget.pickerType == MapPickerType.start) {
                //     context.read<MapCubit>().setStartPoint(position);
                //   } else {
                //     context.read<MapCubit>().setEndPoint(position);
                //   }

                //   Navigator.pop(context, position); // رجّع الإحداثيات بدل العنوان
                // }
                onTap: (LatLng position) async {
                  if (widget.pickerType == MapPickerType.start) {
                    context.read<MapCubit>().setStartPoint(position);
                  } else {
                    context.read<MapCubit>().setEndPoint(position);
                  }

                  // Get address from coordinates
                  final placemarks = await placemarkFromCoordinates(
                    position.latitude,
                    position.longitude,
                  );
                  print('placemarks: ${placemarks}');

                  final place = placemarks.first;
                  final fullAddress = [
                    place.street,
                    place.subLocality,
                    place.locality,
                    place.administrativeArea,
                    place.country
                  ].where((e) => e != null && e.isNotEmpty).join(", ");
                  print('address: ${fullAddress}');
                  Navigator.pop(context, fullAddress);
                },
              ),
            ],
          );
        },
      ),
    );
  }
  // late GoogleMapController _mapController

// Future<void> _setMapStyle(BuildContext context) async {
//   final isDark = Theme.of(context).brightness == Brightness.dark;
//   final stylePath = isDark
//       ? 'assets/map_styles/map_style_dark.json'
//       : 'assets/map_styles/map_style_light.json';

//   final style = await DefaultAssetBundle.of(context).loadString(stylePath);
//   _mapController.setMapStyle(style);
// }
}
