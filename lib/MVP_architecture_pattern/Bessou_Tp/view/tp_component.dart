import 'package:flutter/material.dart';
import 'package:flutter_all/MVP_architecture_pattern/Bessou_Tp/presenter/bessouTpPresenter.dart';
import 'package:flutter_all/MVP_architecture_pattern/Bessou_Tp/view/tp_view.dart';

class BessouTp extends StatefulWidget {
  final BessouTpPresenter presenter;
  BessouTp(this.presenter);
  @override
  _BessouTpState createState() => _BessouTpState();
}

class _BessouTpState extends State<BessouTp> implements BessouTpView {
  var _value1Controller = TextEditingController();
  var _value2Controller = TextEditingController();
  int _radioValue = 0;
  String symbole = "+";
  String resultat = "0.0";
  String _value1, _value2;
  final FocusNode _value1Focus = FocusNode();
  final FocusNode _value2Focus = FocusNode();

  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    this.widget.presenter.bessouTpView = this;
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      symbole = value == 0
          ? "+"
          : value == 1 ? "-" : value == 2 ? "x" : value == 3 ? "/" : "";
    });
    this.widget.presenter.onRadioButtonSelected(symbole);
  }

  @override
  void updateResultValue(double result) {
    setState(() {
      resultat = result.toString();
    });
  }

  @override
  void updateValue1(String value1) {
    setState(() {
      _value1Controller.text = value1;
    });
  }

  @override
  void updateValue2(String value2) {
    setState(() {
      _value1Controller.text = value2;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _value1Controller.dispose();
    _value2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bessou Tp with WVP pattern'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio(
                  activeColor: Colors.blue,
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Add',
                ),
                new Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Sub',
                ),
                new Radio(
                  activeColor: Colors.blue,
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Mult',
                ),
                new Radio(
                  activeColor: Colors.blue,
                  value: 3,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Div',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _value1Controller,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.length == 0 || double.parse(value) == 0.0) {
                          return ('Value1 is empty');
                        }
                      },
                      onSaved: (value) {
                        _value1 = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white, hintText: 'Value 1'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        this.widget.presenter.onButtonClicked(
                          double.parse(_value1.toString()),
                          double.parse(_value1.toString()),
                          symbole);
                      }
                      
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Center(
                        child: Text(symbole,
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _value2Controller,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.length == 0 || double.parse(value) == 0.0) {
                          return ('Value2 is empty');
                        }
                      },
                      onSaved: (value) {
                        _value2 = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white, hintText: 'Value 2'),
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 80.0,
                width: 200,
                child: Center(
                    child: Text(
                  resultat,
                  style: TextStyle(fontSize: 30.0),
                ))),
          ],
        ),
      ),
    );
  }
}
