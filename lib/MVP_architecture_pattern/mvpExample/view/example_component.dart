import 'package:flutter/material.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpExample/presenter/example_presenter.dart';

import 'example_view.dart';

class ExamplePage extends StatefulWidget {
  final BasicExamplePresenter presenter;
  ExamplePage(this.presenter);
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> implements ExampleView {
  var _value1Controller = TextEditingController();
  var _value2Controller = TextEditingController();
  String _value1, _value2;
  var _resultString = '';

  final FocusNode _value1Focus = FocusNode();
  final FocusNode _value2Focus = FocusNode();

  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    this.widget.presenter.exampleView = this;
  }

  void _calculator() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("is validate and values is $_value1 et $_value2");
      this.widget.presenter.onCalculateClicked(_value1, _value2);
    } else {
      print("Not validate");
    }
  }

  @override
  void updateValue1({String value1}) {
    print("Update 1 = ${_value1Controller.text}");
    setState(() {
      _value1Controller.text = value1 != null ? value1 : '';
    });
  }

  @override
  void updateValue2({String value2}) {
    print("Update val2 = ${_value2Controller.text}");
    setState(() {
      _value2Controller.text = value2 != null ? value2 : '';
    });
  }

  @override
  void updateResultValue(String value) {
    setState(() {
      _resultString = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Example Page"),
        ),
        body: Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  value1FormField(),
                  value2FormField(context),
                  Center(
                    child: Text(
                      'Result : $_resultString',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: calculateButton(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  RaisedButton calculateButton() {
    return RaisedButton(
      onPressed: _calculator,
      color: Colors.pinkAccent,
      child: Text(
        'Calculate',
        style: TextStyle(fontSize: 16.9),
      ),
      textColor: Colors.white70,
    );
  }

  TextFormField value1FormField() {
    return TextFormField(
      controller: _value1Controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _value1Focus,
      onFieldSubmitted: (term){
        _fieldFocusChange(context, _value1Focus, _value2Focus);
      },
      validator: (value) {
        if (value.length == 0 || double.parse(value) == 0.0) {
          return ('value1 is empty');
        } 
      },
      onSaved: (value) {
        _value1 = value;
      },
      decoration:
          InputDecoration(icon: Icon(Icons.menu), fillColor: Colors.white),
    );
  }

  TextFormField value2FormField(BuildContext context) {
    return TextFormField(
      controller: _value2Controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      focusNode: _value2Focus,
      onFieldSubmitted: (value){
        _value2Focus.unfocus();
        _calculator();
      },
      validator: (value) {
        if (value.length == 0 || double.parse(value) == 0.0) {
          return ('Height is empty');
        }
      },
      onSaved: (value) {
        _value2 = value;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.assessment),
        fillColor: Colors.white,
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

}
