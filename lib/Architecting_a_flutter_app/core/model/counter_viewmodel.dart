import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  // <-- extends ChangeNotifier
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}

// import 'package:flutter/foundation.dart';

// class CounterViewModel extends ChangeNotifier {
//   int _counter = 0;
//   int get counter => _counter;

//   WebApi _webApi = serviceLocator<WebApi>(); //  <-- service

//   Future loadData() async { //                   <-- load initial data
//     _counter = await _webApi.fetchValue();
//     notifyListeners();
//   }

//   void increment() {
//     _counter++;
//     notifyListeners();
//   }
// }

// // Fake service locator. Use GetIt in a real app.
// // Or inject the service in the view model constructor.
// WebApi serviceLocator<T>() {
//   return WebApi();
// }

// // Fake web api
// class WebApi {
//   Future<int> fetchValue() => Future.delayed(Duration(seconds: 2), () => 11);
// }