import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  bool choolCheckDone = false;
  static final inDistance = 100;
  static final Circle inCircle = Circle(
    circleId: CircleId('in'),
    fillColor: Colors.blue.withOpacity(0.5),
    center: homePosition,
    radius: 100,
    strokeWidth: 2,
    strokeColor: Colors.blue,
  );
  static final Circle outCircle = Circle(
    circleId: CircleId('out'),
    fillColor: Colors.red.withOpacity(0.5),
    center: homePosition,
    radius: 100,
    strokeWidth: 2,
    strokeColor: Colors.red,
  );
  static final Circle okCircle = Circle(
    circleId: CircleId('ok'),
    fillColor: Colors.green.withOpacity(0.5),
    center: homePosition,
    radius: 100,
    strokeWidth: 2,
    strokeColor: Colors.green,
  );
  static final LatLng homePosition = LatLng(35.8389, 128.6194);
  static final Marker marker =
      Marker(markerId: MarkerId('home'), position: homePosition);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder(
          future: checkPermission(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == '위치 정보가 허가되었습니다.') {
              return StreamBuilder<Position>(
                  stream: Geolocator.getPositionStream(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        _CustomMap(
                          circle:
                              checkDistance(snapshot) ? inCircle : outCircle,
                          myPosition: homePosition,
                          marker: marker,
                          mapController: mapControllers,
                        ),
                        _ChoolCheckBtn(
                          choolCheckDone: choolCheckDone,
                          onPressed: onChoolCheckPressed,
                          isInCircle: checkDistance(snapshot),
                        ),
                      ],
                    );
                  });
            }
            return Center(
              child: Text(snapshot.data),
            );
          }),
    );
  }
  mapControllers(GoogleMapController controller){
    mapController = controller;
  }

  AppBar renderAppBar() {
    return AppBar(
      title: Text('ChoolCheck'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.my_location),
          color: Colors.white,
        )
      ],
    );
  }

  onChoolCheckPressed() async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('출근하기'),
            content: Text('출근하겠습니까?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('출근하기')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('취소'))
            ],
          );
        });
    if (result) {
      choolCheckDone = true;
    }
  }

  bool checkDistance(AsyncSnapshot snapshot) {
    bool isInCircle = false;
    if (snapshot.hasData) {
      final start = homePosition;
      final end = snapshot.data!;
      final distanceBetween = Geolocator.distanceBetween(
          start.latitude, start.longitude, end.latitude, end.longitude);
      if (distanceBetween < inDistance) {
        isInCircle = true;
      }
    }
    return isInCircle;
  }

  Future<String> checkPermission() async {
    final locationPermission = await Geolocator.isLocationServiceEnabled();
    if (!locationPermission) {
      return '위치 서비스를 활성화 해주세요.';
    }
    LocationPermission checkPermission = await Geolocator.checkPermission();
    if (checkPermission == LocationPermission.denied) {
      checkPermission = await Geolocator.requestPermission();
      if (checkPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }
    if (checkPermission == LocationPermission.deniedForever) {
      return '앱의 위치정보 권한을 직접 허가해주세요.';
    }

    return '위치 정보가 허가되었습니다.';
  }
}

class _CustomMap extends StatelessWidget {
  final LatLng myPosition;
  final Marker marker;
  final Circle circle;
  final MapCreatedCallback mapController;

  const _CustomMap(
      {required this.circle,
      required this.mapController,
      required this.marker,
      required this.myPosition,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: myPosition, zoom: 15),
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        markers: Set.from([marker]),
        circles: Set.from([circle]),
        onMapCreated: mapController,
      ),
    );
  }
}

class _ChoolCheckBtn extends StatelessWidget {
  final bool isInCircle;
  final VoidCallback onPressed;
  final bool choolCheckDone;

  const _ChoolCheckBtn(
      {required this.onPressed,
      required this.choolCheckDone,
      required this.isInCircle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timelapse_outlined,
            size: 40,
            color: choolCheckDone
                ? Colors.green
                : isInCircle
                    ? Colors.blue
                    : Colors.red,
          ),
          SizedBox(
            height: 20,
          ),
          if (isInCircle && !choolCheckDone)
            TextButton(onPressed: onPressed, child: Text('출근하기')),
        ],
      ),
    );
  }
}
