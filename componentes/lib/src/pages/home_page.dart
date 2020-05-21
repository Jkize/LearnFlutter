 
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data,context),
        );
      },
    );

    // return ListView(
    //   children: _listItems(),
    // );
  }

  List<Widget> _listItems(List<dynamic> data,BuildContext context) {
    final List<Widget> opciones = [];



    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: geticon(element['icon']),
        onTap: () {

          Navigator.pushNamed(context, element["ruta"]);

          // final route=MaterialPageRoute(
          //   builder: (context){
          //     return AlertPage();
          //   } );
          // Navigator.push(context, route);



        },
        trailing: Icon(Icons.keyboard_arrow_right),
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
