import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = "b5e5db295fceb5fd7ec7fa5a1df3a65d";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;
  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(String URL, dynamic JSON) async {
    final url = Uri.http(_url, URL, JSON);
    final resp = await http.get(url);
    final peliculas = Peliculas.fromJsonList(json.decode(resp.body)['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    dynamic jsonToSend = {'api_key': _apikey, 'language': _language};
    return await _procesarRespuesta("3/movie/now_playing", jsonToSend);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];
    _cargando = true;

    _popularesPage++;
    print('Cargando Siguiente...');
    dynamic jsonToSend = {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    };
    final resp = await _procesarRespuesta("3/movie/popular", jsonToSend);
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.http(_url, '3/movie/$peliId/credits',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body); //Nos

    final cast = Cast.fromJsonList(decodedData['cast']);
    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    dynamic jsonToSend = {
      'api_key': _apikey,
      'language': _language,
      'query': query
    };
    return await _procesarRespuesta("3/search/movie", jsonToSend);
  }
}
