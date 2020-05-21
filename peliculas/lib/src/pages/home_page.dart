import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/pages/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/pages/widgets/movie_horizontal.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      //Safe area para dispositivos que tienen hueco
      body: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
            ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

 Widget _footer(BuildContext context ) {
return Container( 
  width: double.infinity,
  child:  Column( 
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 2.0),
        child: Text('Populares',style:Theme.of(context).textTheme.subtitle2)),
      SizedBox(height: 5.0,),
      FutureBuilder(
        future: peliculasProvider.getPopulares() ,
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          print(snapshot.data);
          if(snapshot.hasData){
            return MovieHorizontal(peliculas: snapshot.data);
          }else{
            return Center(child: CircularProgressIndicator());
          } 
        },
      ),
    ],
  ),
);

 }
}
