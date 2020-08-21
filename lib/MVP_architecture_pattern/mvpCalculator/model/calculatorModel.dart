class CalculatorViewModel {
  String _result;

  String inputValue='';
  String outputValue;

  String get result => _result;
  set result(String outResult){
    _result = outResult;
  }
  
  String get resultInString => result;
  String get inputValueInString => inputValue != null ? inputValue.toString():'';
  String get outputValueInString => outputValue != null ? outputValue.toString():'';

  CalculatorViewModel();
}