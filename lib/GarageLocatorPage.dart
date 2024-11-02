import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Garagelocator extends StatefulWidget {
  @override
  _GaragelocatorState createState() => _GaragelocatorState();
}

class _GaragelocatorState extends State<Garagelocator> {
  late GoogleMapController? _mapController;

  final LatLng _darEsSalaam = LatLng(-6.824445, 39.263494);

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dar es Salaam Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _darEsSalaam,
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: MarkerId('Dar es Salaam'),
            position: _darEsSalaam,
            infoWindow: InfoWindow(title: 'Dar es Salaam'),
          ),
        },
      ),
    );
  }
}