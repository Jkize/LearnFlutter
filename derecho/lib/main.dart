import 'package:derecho/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Derecho',
      initialRoute: "/",
      routes: getApplicationRoute(),
    );
  }
}

Map<String, WidgetBuilder> getApplicationRoute() {
  return <String, WidgetBuilder>{"/": (BuildContext context) => HomePage()};
}
