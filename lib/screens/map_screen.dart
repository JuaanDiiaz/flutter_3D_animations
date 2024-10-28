import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

  const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoianVhbmNobzI0IiwiYSI6ImNtMnRheGlxejAxNTAyd3EwM2lwcGwzenoifQ.ig-rH8wsHKuEvGaLrz34ww';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(19.406955247707103, -99.13765581731255),
          initialZoom: 13.0,
          maxZoom: 18.0,
          minZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=$MAPBOX_ACCESS_TOKEN',
            additionalOptions: {
              'accessToken': MAPBOX_ACCESS_TOKEN,
              'id': 'mapbox/streets-v11',
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 30.0,
                height: 30.0,
                point: LatLng(19.406955247707103, -99.13765581731255),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}