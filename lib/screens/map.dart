import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    // this.location = const PlaceLocation(
    //   latitude: 37.422,
    //   longitude: -122.084,
    //   address: '',
    // ),
  });
  // final PlaceLocation location;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Map<String, dynamic>? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select location'),
      ),
      body: FlutterLocationPicker(
        initZoom: 11,
        minZoomLevel: 5,
        maxZoomLevel: 16,
        trackMyPosition: true,
        searchBarBackgroundColor: Colors.white,
        selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
        mapLanguage: 'en',
        selectLocationButtonLeadingIcon: const Icon(Icons.check),
        onPicked: (pickedData) {
          setState(() {
            _pickedLocation = {
              'lat': pickedData.latLong.latitude,
              'long': pickedData.latLong.longitude,
              'address': pickedData.address,
            };
          });
          Navigator.of(context).pop(_pickedLocation);
        },
      ),
    );
  }
}
