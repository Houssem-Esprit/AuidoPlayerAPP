import 'package:flutter/material.dart';
import 'package:lecteurmultimedia/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Player',
      theme: ThemeData(
      ),
      home:SafeArea(
          child:Scaffold(
              body: Container(
                child: HomePage(),
              ),
          )
      ) ,


    );
  }
}
