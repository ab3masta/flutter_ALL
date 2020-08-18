import 'package:flutter/material.dart';
import 'package:flutter_all/Architecting_a_flutter_app/counter_screen.dart';
import 'package:flutter_all/Services_to_do_the_work/ui/counter_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CounterScreen()));
              },
              child: Text('architecting a flutter app'),
            ),
          ),
           Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SworkCounterScreen()));
              },
              child: Text('Service to do work'),
            ),
          )
        ],
      ),
    );
  }
}
