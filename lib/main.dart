import 'package:flutter/material.dart';
import 'package:flutter_all/mainPage.dart';
import 'Services_to_do_the_work/core/services/service_locator.dart';

void main() {
  setupServiceLocator();
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
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
