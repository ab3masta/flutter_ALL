import 'package:flutter_all/MVP_architecture_pattern/Bessou_Tp/model/bessouTpModel.dart';
import 'package:flutter_all/MVP_architecture_pattern/Bessou_Tp/utils/utils.dart';
import 'package:flutter_all/MVP_architecture_pattern/Bessou_Tp/view/tp_view.dart';

class BessouTpPresenter {
  void onButtonClicked(double value1, double value2, String symbole) {}
  void onRadioButtonSelected(String symbole) {}
  void onValue1Submitted(double value1) {}
  void onValue2Submitted(double value2) {}

  set bessouTpView(BessouTpView value) {}
}

class BasicBessouTpPresenter implements BessouTpPresenter {
  BessouTpViewModel _viewModel;
  BessouTpView _view;
  BasicBessouTpPresenter() {
    this._viewModel = BessouTpViewModel();
  }

  @override
  set bessouTpView(BessouTpView value) {
    _view = value;
  }

  @override
  void onButtonClicked(double value1, double value2, String symbole) {
    double val1, val2;
    String sym;
    try {
      val1 = value1;
    } catch (e) {}
    try {
      val2 = value2;
    } catch (e) {}
    try {
      sym = symbole;
    } catch (e) {}
    _viewModel.value1 = val1;
    _viewModel.value2 = val2;
    _viewModel.symbole = sym;
    _viewModel.result =
        calculator(_viewModel.value1, _viewModel.value2, _viewModel.symbole);
    _view.updateResultValue(_viewModel.result);
  }

  @override
  void onRadioButtonSelected(String symbole) {
    try {
      _viewModel.symbole = symbole;
    } catch (e) {}
  }

  @override
  void onValue1Submitted(double value1) {
    try {
      _viewModel.value1 = value1;
    } catch (e) {}
  }

  @override
  void onValue2Submitted(double value2) {
    try {
      _viewModel.value2 = value2;
    } catch (e) {}
  }
}
