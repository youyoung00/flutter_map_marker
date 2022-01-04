import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'location_service.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

class MapSample extends StatefulWidget {
  final String title;
  final String subTitle;

  const MapSample({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _searchController = TextEditingController();

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  double zoom = 14.4746;

  late CameraPosition _kGooglePlex;

  LatLng currentTarget = LatLng(37.42796133580664, -122.085749655962);

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: zoom,
    );
    super.initState();
    _setMarker(LatLng(37.42796133580664, -122.085749655962));
    _goToCity();
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker'),
          position: point,
        ),
      );
    });
  }

  // static final Marker _kGooglePlexMarker = Marker(
  //     markerId: MarkerId('kGooglePlex'),
  //     infoWindow: InfoWindow(title: 'Google Plex'),
  //     icon: BitmapDescriptor.defaultMarker,
  //     position: LatLng(37.42796133580664, -122.085749655962));
  //
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  //
  // static final Marker _kLakeMarker = Marker(
  //     markerId: MarkerId('_kLakePlex'),
  //     infoWindow: InfoWindow(title: 'Lake'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     position: LatLng(37.43296265331129, -122.08832357078792));
  //
  // static final Polyline _kPolyline = Polyline(
  //     polylineId: PolylineId('_kPolyline'),
  //     points: [
  //       LatLng(37.42796133580664, -122.085749655962),
  //       LatLng(37.43296265331129, -122.08832357078792),
  //     ],
  //     width: 5);
  //
  // static final Polygon _kPolygon = Polygon(
  //   polygonId: PolygonId('_kPolygon'),
  //   points: [
  //     LatLng(37.43296265331129, -122.08832357078792),
  //     LatLng(37.42796133580664, -122.085749655962),
  //     LatLng(37.418, -122.092),
  //     LatLng(37.435, -122.092),
  //   ],
  //   strokeWidth: 5,
  //   fillColor: Colors.transparent,
  // );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 32),
            color: const Color.fromRGBO(140, 70, 106, 1),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.subTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Nonstop - 2h 12m*',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        width: 70,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () async {
                            final googleMapController =
                                await _controller.future;

                            var currentZoomLevel =
                                await googleMapController.getZoomLevel();

                            if (currentZoomLevel > 20) {
                              currentZoomLevel = currentZoomLevel - 8;
                              // print('if 줌레벨 확인 : ${currentZoomLevel}');
                            } else {
                              currentZoomLevel = currentZoomLevel + 2;
                              // print('else 줌레벨 확인 : ${currentZoomLevel}');
                            }

                            googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: currentTarget,
                                  zoom: currentZoomLevel,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        width: 70,
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () async {
                            final googleMapController =
                                await _controller.future;

                            var currentZoomLevel =
                                await googleMapController.getZoomLevel();

                            if (currentZoomLevel < 3.0) {
                              currentZoomLevel = currentZoomLevel + 12;
                              // print('if 줌레벨 확인 : ${currentZoomLevel}');
                            } else {
                              currentZoomLevel = currentZoomLevel - 2;
                              // print('else 줌레벨 확인 : ${currentZoomLevel}');
                            }

                            googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: currentTarget,
                                  zoom: currentZoomLevel,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              polygons: _polygons,
              // {_kGooglePlexMarker},
              // _kLakeMarker,

              // polylines: {
              //   _kPolyline,
              // },
              // polygons: {
              //   _kPolygon,
              // },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (cameraPosition) {
                currentTarget = cameraPosition.target;
              },
              onTap: (point) {
                setState(() {
                  polygonLatLngs.add(point);
                });
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToCity() async {
    var place = await LocationService().getPlace(widget.title);
    _goToPlace(place);
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12,
        ),
      ),
    );
    _setMarker(LatLng(lat, lng));
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }

// Future<void> _goToTheLake() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// }
}
