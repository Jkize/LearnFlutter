import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Full'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks', style: _estiloTexto),
            Text('$_conteo', style: _estiloTexto)
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
      //floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width:30),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: () {
            setState(() {
              this._conteo=0;
            });
          },
        ),
        Expanded(child: SizedBox(width: 5)),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            setState(() {              
            this._conteo--;
            });
          },
        ),
        SizedBox(width: 5),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              
            this._conteo++;
            });
          },
        )
      ],
    );
  }
}
