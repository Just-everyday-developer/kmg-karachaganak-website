import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(51.130596308257495, 71.42343268872816); // Координаты офиса КМГ-К

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SizedBox(
        height: 400,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("main_location"),
              position: _center,
              infoWindow: const InfoWindow(
                title: 'Наш офис',
                snippet: 'БЦ Изумрудный квартал',
              ),
            ),
          },
        ),
      );
    } else {
      return const Text("Карта доступна только в веб-версии");
    }
  }
}