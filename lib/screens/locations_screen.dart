import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DynamicMaps extends StatefulWidget {
  const DynamicMaps({Key? key}) : super(key: key);

  @override
  State<DynamicMaps> createState() => DynamicMapsState();
}

class DynamicMapsState extends State<DynamicMaps> {
  final TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
//! this is to show a marker on the map dynamically
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  List<LatLng> polygonLatLng = [];
  int _polygonIdCounter = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarker(LatLng(37.42796133580664, -122.085749655962));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('marker'), position: point),
      );
    });
  }

  // void _setPolygon() {}

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search by city',
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var place = await LocationService()
                        .getPlace(_searchController.text);
                    _goToPlace(place);
                  },
                  icon: Icon(Icons.search),
                ),
              ],
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
              ),
            ),
          ],
        ),
        cupertino: (_, __) => CupertinoPageScaffoldData(
              body: Card(
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoSearchTextField(),
                          ),
                          IconButton(
                            onPressed: () async {
                              var place = await LocationService()
                                  .getPlace(_searchController.text);
                              _goToPlace(place);
                            },
                            icon: Icon(Icons.search),
                          ),
                        ],
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        // floatingActionButton: Floatin,
        );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 20),
      ),
    );
    _setMarker(LatLng(lat, lng));
  }
}

class LocationService {
  final String key = 'AIzaSyBV2O0Yy9IC189YgvUgKHraOT1bnl1ZA-U';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    // print(placeId);
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    // print(results);
    return results;
  }
}
