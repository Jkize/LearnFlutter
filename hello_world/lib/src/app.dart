
import 'package:flutter/material.dart';
import 'package:hello_world/src/pages/contador_page.dart'; 
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Center(
        //child:HomePage()
        child:ContadorPage()
      ),
    );
  }
}