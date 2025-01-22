import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const AIDApp());

void alertContacts() {
  print("Alerted!");
}

class AIDApp extends StatelessWidget {
  const AIDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)
              .copyWith(primary: Colors.amber.shade500)),
      home: const Lifelines(),
    );
  }
}

class Lifelines extends StatefulWidget {
  const Lifelines({super.key});

  @override
  State<Lifelines> createState() => MenuState();
}

class MenuState extends State<Lifelines> {
  int currentPageIndex = 0;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(31.5017, 34.4668);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      /// Navigation bar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: theme.colorScheme.primary,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          const NavigationDestination(
            icon: Icon(Icons.sos_sharp),
            label: 'SOS',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_sharp),
            label: 'Map',
          ),
          const NavigationDestination(
            icon: Badge(
              child: Icon(Icons.newspaper_sharp),
            ),
            label: 'News',
          ),
        ],
      ),
      body: <Widget>[
        /// SOS button
        Center(
          child: ButtonTheme(
              minWidth: 300.0,
              height: 150.0,
              child: FilledButton(
                onPressed: () => alertContacts(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(80)),
                child: const Text(
                  "SOS",
                  style: TextStyle(
                    fontSize: 48,
                  ),
                ),
              )),
        ),

        /// Google Maps
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.green[700],
          ),
          home: Scaffold(
              body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
          )),
        ),

        /// Placeholder news
        ListView.builder(
          reverse: false,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.article), // Placeholder for news icon
              title: Text(
                'News Article ${index + 1}', // Example news title
                style: theme.textTheme.bodyLarge,
              ),
              subtitle: Text(
                'Please evacuate now.',
                style: theme.textTheme.bodySmall,
              ),
              onTap: () {
                // Handle news article tap, could navigate to a detailed page.
                print('Tapped on entry ${index + 1}');
              },
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
