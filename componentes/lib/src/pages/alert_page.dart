import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlert(context),
          child: Text("Mostrar Alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){ 
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column( 
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo( size:100.0 )
            ],
          ),
          actions: <Widget>[ 
            FlatButton(onPressed: ()=>Navigator.of(context).pop() , child: Text('Cancelar')),
            FlatButton(onPressed: ()=>Navigator.of(context).pop() , child: Text('Ok'))
          ],
          
         );
       },

    );
  }
}
