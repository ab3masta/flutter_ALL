import 'package:flutter_all/MVP_architecture_pattern/mvpCalculator/model/calculatorModel.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpCalculator/utils/calculatorUtils.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpCalculator/view/basicCalculator_view.dart';

class CalculatorPresenter {
  void onEqualClicked(String inputValue) {}
  void onAcButtonClicked() {}
  void onClearButtonClicked(String inputValue) {}
  void onButtonValueClicked(String newValue) {}

  set exampleView(CalculatorView value) {}

  void onInputValueSubmitted(String value1) {}
}

class BasicCalculatorPresenter implements CalculatorPresenter {
  CalculatorViewModel _viewModel;
  CalculatorView _view;

  BasicCalculatorPresenter() {
    this._viewModel = CalculatorViewModel();
  }

  @override
  set exampleView(CalculatorView value) {
    this._view = value;
  }

  @override
  void onEqualClicked(String inputValue) {
    String inputVal;

    try {
      inputVal = inputValue;
    } catch (e) {}

    _viewModel.inputValue = inputValue;
    _viewModel.result = btnEqual(inputVal);
    print('le resultat est ${_viewModel.resultInString}');
    _view.updateOutputValue(outputValue:_viewModel.resultInString);
  }

  @override
  void onInputValueSubmitted(String inputValue) {
    try {
      _viewModel.inputValue = inputValue;
    } catch (e) {}
  }

  @override
  void onAcButtonClicked() {
    _view.updateInputValue(inputValue:'');
    _view.updateOutputValue(outputValue:'');
  }

  @override
  void onClearButtonClicked(String inputValue) {
    _viewModel.inputValue = (_viewModel.inputValue.length > 0)
        ? (_viewModel.inputValue.substring(0, _viewModel.inputValue.length - 1))
        : "";
  }

  @override
  void onButtonValueClicked(String newValue) {
    _viewModel.inputValue = _viewModel.inputValue.toString() + newValue;
    _view.updateInputValue(inputValue:_viewModel.inputValue.toString());
    print("${_viewModel.inputValue}");
  }
}
