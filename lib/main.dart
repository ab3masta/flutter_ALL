import 'package:flutter/material.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpExample/presenter/example_presenter.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpExample/view/example_component.dart';
import 'package:flutter_all/mainPage.dart';
import 'MVP_architecture_pattern/mvpCalculator/presenter/calculatorPresenter.dart';
import 'MVP_architecture_pattern/mvpCalculator/view/basicCalculator_component.dart';
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
      //home: MainPage(),
      home: BasicCalculator(new BasicCalculatorPresenter()),
      debugShowCheckedModeBanner: false,
    );
  }
}
