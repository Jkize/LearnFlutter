import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreader/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = MapController();

  int posTypeMap = 0;
  List<String> tiposMapas = [
    'streets',
    "satellite",
    "streets",
    "dark",
    "light"
  ];

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Coordenada QR"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              map.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(center: scan.getLatLng(), zoom: 15),
      layers: [_crearMapa(), _crearMarcadores(scan)],
    );
  }

  _crearMapa() {
    //Token: pk.eyJ1IjoiamtpemUiLCJhIjoiY2tkejB6emo4Mmc1aDJwbjlzanN6YTliOSJ9.n5B2Nj9-L8WxFPWitQ-dYw

    return TileLayerOptions(
        urlTemplate: 'https://api.tiles.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiamtpemUiLCJhIjoiY2tkejB6emo4Mmc1aDJwbjlzanN6YTliOSJ9.n5B2Nj9-L8WxFPWitQ-dYw',
          'id': 'mapbox.${tiposMapas[posTypeMap]}'
          //satellite, streets, dark, light
        });
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
        width: 100.0,
        height: 100.0,
        point: scan.getLatLng(),
        builder: (context) => Container(
          child: Icon(
            Icons.location_on,
            size: 45.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      )
    ]);
  }

  Widget _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        setState(() {
          posTypeMap = (posTypeMap + 1) % 5;
        });
      },
    );
  }
}
