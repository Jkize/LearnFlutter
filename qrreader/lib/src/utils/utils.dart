import 'package:qrreader/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';


abrirScan(ScanModel scan, BuildContext context) async {
  if (scan.tipo == "http") {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  }else{
    Navigator.pushNamed(context,'mapa', arguments: scan);
  }
}
