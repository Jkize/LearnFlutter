//import 'package:componentes/pages/home_temp.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate 
      ],
      supportedLocales: [
        const Locale('es'), // English
        const Locale('en') // Hebrew 
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      //home: HomePage()
      routes: getApplicationRoute(),
      onGenerateRoute: (settings) {
        //Sí no está la ruta se ejecuta lo siguiente
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
