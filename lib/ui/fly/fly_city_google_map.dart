import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../api_connect/location_service.dart';

class MapSample extends StatefulWidget {
  final String cityName;
  final String cityInfo;

  const MapSample({Key? key, required this.cityName, required this.cityInfo})
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
                  widget.cityInfo,
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
    );
  }

  Future<void> _goToCity() async {
    var place = await LocationService().getPlace(widget.cityName);
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
}
