import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GoogleMapController? _controller;
  LatLng _initialPosition = LatLng(37.7749, -122.4194); // 샌프란시스코의 기본 위치
  Location _location = Location();
  Marker? _userMarker;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    // 위치 권한 요청
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // 현재 위치 가져오기
    final userLocation = await _location.getLocation();
    setState(() {
      _initialPosition =
          LatLng(userLocation.latitude!, userLocation.longitude!);
      _userMarker = Marker(
        markerId: MarkerId("user_location"),
        position: _initialPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: "You are here"),
      );
    });

    _controller?.animateCamera(
      CameraUpdate.newLatLng(_initialPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: _userMarker != null ? {_userMarker!} : {},
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
