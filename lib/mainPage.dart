import 'package:flutter/material.dart';
import 'package:flutter_all/Architect_project_using_blogPattern/src/ui/movie_list.dart';
import 'package:flutter_all/Architecting_a_flutter_app/counter_screen.dart';
import 'package:flutter_all/MVP_architecture_pattern/bmi/views/bmi_component.dart';
import 'package:flutter_all/MVP_architecture_pattern/bmi/presenter/bmi_presenter.dart';
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SworkCounterScreen()));
              },
              child: Text('Service to do work'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MovieList()));
              },
              child: Text('Architect project using blog pattern'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => new HomePage(new BasicBMIPresenter())));
              },
              child: Text('MVP architecture pattern'),
            ),
          ),
        ],
      ),
    );
  }
}
 //home: new HomePage(new BasicBMIPresenter()),