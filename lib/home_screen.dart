import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'packages:aid/sos_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const LatLng _center = LatLng(37.7749, -122.4194); // San Francisco coordinates

  void _onMapCreated(GoogleMapController controller) {
    // You can use the controller to manipulate the map if needed
  }

  void _onSOSPressed() {
    // Implement SOS functionality here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('SOS Activated'),
          content: const Text('Emergency services have been notified.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps SOS'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: SOSButton(onPressed: _onSOSPressed),
          ),
        ],
      ),
    );
  }
}

