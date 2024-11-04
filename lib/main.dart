import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '현재 위치 불러오기',
        home: MapSample()
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? _controller;
  Location _location = Location();

  // 현재 위치를 저장할 변수
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  // 위치 초기화 함수
  void _initializeLocation() async {
    // 위치 권한 확인 및 요청
    PermissionStatus status = await _location.hasPermission();
    if (status == PermissionStatus.denied) {
      status = await _location.requestPermission();
      if (status != PermissionStatus.granted) {
        // 권한이 거부된 경우 처리
        return;
      }
    }

    // 위치 서비스 활성화 여부 확인
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        // 위치 서비스가 활성화되지 않은 경우 처리
        return;
      }
    }

    // 현재 위치 가져오기
    LocationData currentLocation = await _location.getLocation();

    setState(() {
      _currentPosition = LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      );
    });

    // 위치 변경 시 카메라 이동
    // _location.onLocationChanged.listen((LocationData newLocation) {
    //   if (_controller != null) {
    //     _controller!.animateCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(
    //           target: LatLng(
    //             newLocation.latitude!,
    //             newLocation.longitude!,
    //           ),
    //           zoom: 15.0,
    //         ),
    //       ),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // 위치 정보를 아직 가져오지 못한 경우 로딩 인디케이터 표시
    if (_currentPosition == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('현재 위치 불러오기'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // 위치 정보를 가져온 후에 지도를 표시
    return Scaffold(
      appBar: AppBar(
        title: Text('현재 위치 불러오기'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition!,
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
