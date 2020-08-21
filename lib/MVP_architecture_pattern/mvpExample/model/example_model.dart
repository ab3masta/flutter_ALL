class ExampleViewModel {
  double _result = 0.0;

  double value1;
  double value2;

  double get result => _result;
  set result(double outResult){
    _result = outResult;
  }
  
  String get resultInString => result.toStringAsFixed(2);
  String get value1InString => value1 != null ? value1.toString():'';
  String get value2InString => value2 != null ? value2.toString():'';

  ExampleViewModel();
}