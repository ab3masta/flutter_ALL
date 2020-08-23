import 'package:flutter/material.dart';
import 'Weather_BlocPattern_ApiCalling/weatherMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MainPage(),
      home: WeaterMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}
