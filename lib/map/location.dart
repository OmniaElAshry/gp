import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:gp/map/components.dart';
import 'package:location/location.dart'as loc;


class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng destLocation = LatLng(30.0566104, 31.3301076);
  bool _isSheetOpen = false;
  TextEditingController _startAddressController = TextEditingController();
  TextEditingController _endAddressController = TextEditingController();

  List<LatLng> _polylineCoordinates = [];
  loc.LocationData? _currentLocation;

  Future<void> _getCurrentLocation() async {
    loc.Location location = loc.Location();
    _currentLocation = await location.getLocation();
    setState(() {});
    await _getPolylinePoints();
  }

  Future<void> _getPolylinePoints() async {
    PolylinePoints polylinePoint = PolylinePoints();
    PolylineResult result = await polylinePoint.getRouteBetweenCoordinates(
      google_api,
      PointLatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
      PointLatLng(destLocation.latitude, destLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => _polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    _getCurrentLocation();
    _getPolylinePoints();
    super.initState();
  }
  Future<String> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latLng.latitude, latLng.longitude,
          localeIdentifier: Platform.localeName);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address = placemark.street ?? '';
        if (placemark.subThoroughfare != null) {
          address = '${placemark.subThoroughfare} $address';
        }
        if (placemark.thoroughfare != null) {
          address = '${placemark.thoroughfare}, $address';
        }
        if (placemark.subLocality != null) {
          address = '$address, ${placemark.subLocality}';
        }
        if (placemark.locality != null) {
          address = '$address, ${placemark.locality}';
        }
        if (placemark.administrativeArea != null) {
          address = '$address, ${placemark.administrativeArea}';
        }
        if (placemark.postalCode != null) {
          address = '$address ${placemark.postalCode}';
        }
        if (placemark.country != null) {
          address = '$address, ${placemark.country}';
        }
        return address;
      }
    } catch (e) {
      print(e);
    }
    return '';
  }
  void _openLocationSheet() {
    setState(() {
      _isSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _startAddressController,
                  decoration: InputDecoration(
                    labelText: 'Start Address',
                    labelStyle: TextStyle(
                        color:Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),

                    suffixIcon: IconButton(
                      color:Colors.red,
                      splashColor: const Color(0xFFCF283C),
                      iconSize: 30,
                      onPressed: (){
                        print('hello');
                      },

                      icon: const Icon(Icons.location_on) ,

                    ),
                  ),

                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _endAddressController,
                  decoration: InputDecoration(
                    labelText: 'Destination Address',
                    labelStyle: TextStyle(
                        color:Color(0xFF836D9A),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),

                    suffixIcon: IconButton(
                      color:const Color(0xFF442268),
                      splashColor: const Color(0xFFCF283C),
                      iconSize: 30,
                      onPressed: (){
                        print('hello');
                      },

                      icon: const Icon(Icons.location_on) ,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: const Text('OK'),

                style:ElevatedButton.styleFrom(

                    primary:Color(0xFF442268) ,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                ),

                onPressed: () {
                  print(_startAddressController.text);
                  print(_endAddressController.text);

                },
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Google Map",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: _currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            _currentLocation!.latitude!,
            _currentLocation!.longitude!,
          ),
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: LatLng(
              _currentLocation!.latitude!,
              _currentLocation!.longitude!,
            ),
            onTap: () async {
              final String address =
              await _getAddressFromLatLng(LatLng(_currentLocation!.latitude!,
                  _currentLocation!.longitude!));
              setState(() {
                _startAddressController.text = address;
              });
            },
          ),
          Marker(
            markerId: const MarkerId("dest"),
            position: destLocation,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: _polylineCoordinates,
            color: const Color(0xFF442268),
          )
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openLocationSheet,
        child: Icon(Icons.location_on),
      ),
    );
  }
}