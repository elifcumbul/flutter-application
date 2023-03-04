import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


//const LatLng SOURCE_LOCATION = LatLng(38.4237, 27.1428); //izmir
const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.743902, -71.170009);

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapPageTab extends StatefulWidget {
  const MapPageTab({Key? key}) : super(key: key);

  @override
  State<MapPageTab> createState() => _MapPageTabState();
}

class _MapPageTabState extends State<MapPageTab> {
  Set<Marker> _markers = Set<Marker>();
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

  late LatLng currentLocation;
  late LatLng destinationLocation;
  //LatLng selectedLocation;

  @override
  void initState() {
    super.initState();
    //set up initial locations
    setInitialLocation();

    //set up marker icons
    setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/source_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/destination_pin.png');
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Take Me Out',
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      body: Stack(
        children: [ 
          Card(
            margin: EdgeInsets.only(top:10.0, bottom: 400.0, right: 5.0, left: 5.0),
            child: Positioned.fromRect(
              rect: Rect.fromCenter(center: Offset(200, 200), width: 300, height: 300),
              child: GoogleMap(
                  myLocationButtonEnabled: true,
                  compassEnabled: false,
                  tiltGesturesEnabled: false,
                  markers: _markers,
                  mapType: MapType.normal,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
          
                    showPinsOnMap();
                  }),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      offset: Offset.zero,
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/bd/9e/c3/bd9ec30497867b0bc1c7bc5cf81d0aa2.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Search Events..',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 236, 160, 59),
                          ),
                        ),
                        Text(
                          'Choose Location',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipOval(
                    clipBehavior: Clip.none,
                    child: Image.asset(
                      'assets/images/placeholder.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: Offset.zero,
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipOval(
                              clipBehavior: Clip.none,
                              child: Image.asset(
                                'assets/images/calendar.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Name',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            const Text('Event Location'),
                            const Text('start date',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 198, 128, 21),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:110.0),
                          child: ClipOval(
                            clipBehavior: Clip.none,
                            child: Image.asset(
                              'assets/images/bookmark.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipOval(
                              clipBehavior: Clip.none,
                              child: Image.asset(
                                'assets/images/calendar.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Name',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            const Text('Event Location'),
                            const Text('start date',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 198, 128, 21),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:110.0),
                          child: ClipOval(
                            clipBehavior: Clip.none,
                            child: Image.asset(
                              'assets/images/bookmark.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('sourcePin'),
        position: currentLocation,
        icon: sourceIcon,
      ));

      _markers.add(Marker(
        markerId: const MarkerId('destinationPin'),
        position: destinationLocation,
        icon: destinationIcon,
      ));
    });
  }
}
