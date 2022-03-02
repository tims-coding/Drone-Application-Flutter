import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _counter = 0;
  double _left = 0;
  double _right = 0;
  double coordLat = 37.773972;
  double coordLon = -122.431297;

  void _leftDown() {
    setState(() {
      _left = _left + .001;
    });
  }

  void _leftUp() {
    setState(() {
      _left = _left - .001;
    });
  }

  void _rightUp() {
    setState(() {
      _right = _right + .001;
    });
  }

  void _rightDown() {
    setState(() {
      _right = _right - .001;
    });
  }

  void _increment() {
    setState(() {
      _counter = _counter + .001;
    });
  }

  void _dincrement() {
    setState(() {
      _counter = _counter - .001;
    });
  }

  void _largerFactor() {
    setState(() {
      _counter = _counter * 10;
    });
  }

  void _smallerFactor() {
    setState(() {
      _counter = _counter / 10;
    });
  }

  void _moveWholePolygon() {
    setState(() {
      coordLat = coordLat - .001;
    });
  }

  void _moveWholePolygonUp() {
    setState(() {
      coordLat = coordLat + .001;
    });
  }

  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.773972, -122.431297),
              zoom: 15,
            ),
            polygons: myPolygon(coordLon, coordLat, _counter, _left, _right),
          ),
          Positioned(
              top: 50,
              left: 175,
              child: ElevatedButton(
                  onPressed: () => _increment(), child: Text('taller'))),
          Positioned(
              bottom: 0,
              left: 175,
              child: ElevatedButton(
                  onPressed: () => _dincrement(), child: Text('shorter'))),
          Positioned(
              top: 40,
              left: 20,
              child: ElevatedButton(
                  onPressed: () => _largerFactor(), child: Text('factor up'))),
          Positioned(
              top: 80,
              left: 20,
              child: ElevatedButton(
                  onPressed: () => _smallerFactor(),
                  child: Text('factor down'))),
          Positioned(
              top: 370,
              left: 0,
              child: Container(
                color: Colors.blue.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: _leftUp,
                    child: Material(
                        elevation: 3,
                        color: Colors.blue,
                        child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              )),
          Positioned(
              top: 430,
              left: 0,
              child: Container(
                color: Colors.blue.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: _leftDown,
                    child: Material(
                        elevation: 3,
                        color: Colors.blue,
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              )),
          Positioned(
              top: 370,
              left: 370,
              child: Container(
                color: Colors.blue.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: _rightUp,
                    child: Material(
                        elevation: 3,
                        color: Colors.blue,
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              )),
          Positioned(
              top: 430,
              left: 370,
              child: Container(
                color: Colors.blue.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: _rightDown,
                    child: Material(
                        elevation: 3,
                        color: Colors.blue,
                        child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              )),
          Positioned(
              bottom: 120,
              right: 0,
              child: ElevatedButton(
                  onPressed: () => _moveWholePolygon(),
                  child: Text('Move polygon down'))),
          Positioned(
              bottom: 160,
              right: 0,
              child: ElevatedButton(
                  onPressed: () => _moveWholePolygonUp(),
                  child: Text('Move polygon up'))),
        ],
      ),
    );
  }
}

Set<Polygon> myPolygon(double coordLon, double coordLat, double latMultiplier,
    double leftSide, double rightSide) {
  var polygonCoords = List<LatLng>();

  polygonCoords.add(LatLng(coordLat, coordLon + rightSide));
  polygonCoords.add(LatLng(coordLat, coordLon + leftSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier, coordLon + leftSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier, coordLon + rightSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 2, coordLon + rightSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 2, coordLon + leftSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 3, coordLon + leftSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 3, coordLon + rightSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 4, coordLon + rightSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 4, coordLon + leftSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 5, coordLon + leftSide));
  polygonCoords.add(LatLng(coordLat + latMultiplier * 5, coordLon + rightSide));

  var polygonSet = Set<Polygon>();
  polygonSet.add(Polygon(
      polygonId: PolygonId('1'),
      points: polygonCoords,
      fillColor: Colors.transparent,
      strokeColor: Colors.red));

  return polygonSet;
}
