import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class CardSwiper extends StatelessWidget {
 final List<Pelicula> peliculas;

 CardSwiper({@required this.peliculas});


  @override
  Widget build(BuildContext context) {

    final _screenSize=MediaQuery.of(context).size;
    


    return Container(
     padding: EdgeInsets.only(top: 10.0), 
     child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return 
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                fit: BoxFit.fill,
                fadeInDuration: Duration(milliseconds: 200),
                placeholder: AssetImage("assets/loading.gif"),
               image: NetworkImage(peliculas[index].getPosterImg()))
            );
          },
          itemCount: peliculas.length, 
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width*0.5,
          itemHeight: _screenSize.width*0.7,

        ),
   );
  }
}