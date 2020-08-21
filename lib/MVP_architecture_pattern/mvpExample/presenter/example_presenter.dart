import 'package:flutter_all/MVP_architecture_pattern/mvpExample/model/example_model.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpExample/utils/example_utils.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpExample/view/example_view.dart';

class ExamplePresenter {
  void onCalculateClicked(String value1String, String value2String) {}

  set exampleView(ExampleView value) {}

  void onValue1Submitted(String value1) {}
  void onValue2Submitted(String value2) {}
}

class BasicExamplePresenter implements ExamplePresenter {
  ExampleViewModel _viewModel;
  ExampleView _view;

  BasicExamplePresenter() {
    this._viewModel = ExampleViewModel();
  }

  @override
  set exampleView(ExampleView value) {
    _view = value;
  }

  @override
  void onCalculateClicked(String value1String, String value2String) {
    var value1 = 0.0;
    var value2 = 0.0;
    try {
      value1 = double.parse(value1String);
    } catch (e) {}
    try {
      value2 = double.parse(value2String);
    } catch (e) {}
    _viewModel.value1 = value1;
    _viewModel.value2 = value2;
    _viewModel.result = calculator(value1, value2);
    print('le resultat est ${_viewModel.resultInString}');
    _view.updateResultValue(_viewModel.resultInString);
  }

  @override
  void onValue1Submitted(String value1) {
    try {
      _viewModel.value1 = double.parse(value1);
    } catch (e) {}
  }

  @override
  void onValue2Submitted(String value2) {
    try {
      _viewModel.value1 = double.parse(value2);
    } catch (e) {}
  }
}
