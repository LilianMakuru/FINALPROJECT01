import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dar es Salaam Map',
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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