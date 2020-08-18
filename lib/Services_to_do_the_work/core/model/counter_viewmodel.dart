import 'package:flutter/foundation.dart';
import 'package:flutter_all/Services_to_do_the_work/core/services/service_locator.dart';
import 'package:flutter_all/Services_to_do_the_work/core/services/storage_service.dart';

class SworkCounterViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  StorageService _storageService = locator<StorageService>();

  Future loadData() async {
    _counter = await _storageService.getCounterValue();
    notifyListeners();
  }

  void increment() {
    _counter++;
    _storageService.saveCounterValue(_counter);
    notifyListeners();
  }
}