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
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(primary: Colors.amber)),
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
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

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
