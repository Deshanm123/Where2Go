import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {

  GoogleMapController mapController;
  Position currentPosition;

get newGoogleMapController => null;

// for markers


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          // Colombo Co-ordinates
          initialCameraPosition: CameraPosition(target: LatLng(6.927079, 79.861244),zoom:14),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true, // Add little blue dot for device location, requires permission from user
          mapType: MapType.normal, 
         // trackCameraPosition: true
        ),
        //button
        Positioned(
          bottom: 50,
          right: 10,
          child: 
          FlatButton(
            child: Icon(Icons.pin_drop),
            color: Colors.green,
            onPressed: movetoBoston,
            // => _addMarker()
          ),
        ),
      ]
    );
  }

movetoBoston(){
  mapController.animateCamera(CameraUpdate.newCameraPosition(
    CameraPosition(target: LatLng(40.7128,-74.0060),zoom:12.0),
  ));
}

void locatePosition() async{

  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    if (permission == LocationPermission.denied) {
  
      return Future.error(
          'Location permissions are denied');
    }
  }
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

      Position position =  await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
     
      //getting user location interms of longitudes and latitudes
      LatLng latLngPosition = LatLng(position.latitude,position.longitude);

    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLngPosition,zoom:12.0),
    ));

    //creating current camera postion
  //     CameraPosition cameraPosition = new CameraPosition(target:latLngPosition,zoom:14);
  //   //animate 
  //   newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  // //  get output via print
  //   print('${position.latitude}, ${position.longitude}');
  }




  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      locatePosition();
      
    // this guide to kandy
      // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng( 7.290572, 80.633728),
      // zoom:14)));
    
    });
  }


 //geo locator to get current position
// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//     } 
//     if (permission == LocationPermission.denied) {
//       return Future.error(
//           'Location permissions are denied');
//     }
//   }
//   return await Geolocator.getCurrentPosition();
// }
  
// _addMarker(){


  // var marker = Marker(
  //   markerId:MarkerId('current position'),
  //   // position: _getCurrentPosition(),
  //   //try to get from _determinePosition(),
  //   // mapController.cameraPosition.target,
  //   icon: BitmapDescriptor.defaultMarker,
  //   // infoWindowText: InfoWindowText('Magic Marker', '🍄🍄🍄')
  // );

  // mapController.addMarker(marker);
// }
 
}