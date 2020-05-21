import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = "b5e5db295fceb5fd7ec7fa5a1df3a65d";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";

  Future<List<Pelicula>> _procesarRespuesta(String URL) async {
    final url =
        Uri.http(_url, URL, {'api_key': _apikey, 'language': _language});
    final resp = await http.get(url);
    final peliculas = Peliculas.fromJsonList(json.decode(resp.body)['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    return await _procesarRespuesta("3/movie/now_playing");
  }

  Future<List<Pelicula>> getPopulares() async {
    return await _procesarRespuesta("3/movie/popular");
  }
}
