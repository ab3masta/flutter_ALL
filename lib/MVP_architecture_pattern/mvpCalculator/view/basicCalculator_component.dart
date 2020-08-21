import 'package:flutter/material.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpCalculator/presenter/calculatorPresenter.dart';
import 'package:flutter_all/MVP_architecture_pattern/mvpCalculator/view/basicCalculator_view.dart';
import 'package:math_expressions/math_expressions.dart';

class BasicCalculator extends StatefulWidget {
  final BasicCalculatorPresenter presenter;
  BasicCalculator(this.presenter);
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

final textControllerInput = TextEditingController();
final textControllerResult = TextEditingController();

class _BasicCalculatorState extends State<BasicCalculator>
    implements CalculatorView {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double width, height;
  @override
  void initState() {
    super.initState();
    textControllerInput.addListener(() {});
    textControllerResult.addListener(() {});
    this.widget.presenter.exampleView = this;
  }

  @override
  void dispose() {
    textControllerInput.dispose();
    textControllerResult.dispose();
    super.dispose();
  }

  @override
  void updateInputValue({String inputValue}) {
    print("Input = $inputValue");
    setState(() {
      textControllerInput.text = inputValue;
    });
  }

  @override
  void updateOutputValue({String outputValue}) {
    setState(() {
      textControllerResult.text = outputValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final drawerItems = Container(
        height: height,
        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
            )
          ],
        ));
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: drawerItems,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.blueGrey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  }),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: "0",
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontFamily: 'RobotoMono',
                        )),
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                    ),
                    textAlign: TextAlign.right,
                    controller: textControllerInput,
                    onTap: () =>
                        FocusScope.of(context).requestFocus(new FocusNode()),
                  )),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: "Result Here",
                        hintStyle: TextStyle(fontFamily: 'RobotoMono')),
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                    controller: textControllerResult,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btnAC(
                    'AC',
                    Colors.blueGrey[900],
                  ),
                  btnClear(),
                  btn(
                    '%',
                    Colors.blueGrey[900],
                  ),
                  btn(
                    '/',
                    Colors.blueGrey[900],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btn('7', Colors.blueGrey),
                  btn('8', Colors.blueGrey),
                  btn('9', Colors.blueGrey),
                  btn(
                    '*',
                    Colors.blueGrey[900],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btn('4', Colors.blueGrey),
                  btn('5', Colors.blueGrey),
                  btn('6', Colors.blueGrey),
                  btn(
                    '-',
                    Colors.blueGrey[900],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btn('1', Colors.blueGrey),
                  btn('2', Colors.blueGrey),
                  btn('3', Colors.blueGrey),
                  btn(
                    '+',
                    Colors.blueGrey[900],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btn('0', Colors.blueGrey),
                  btn('.', Colors.blueGrey),
                  btnEqual('='),
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget btn(btntext, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(
              fontSize: 28.0, color: Colors.white, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          this.widget.presenter.onButtonValueClicked(btntext);
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueGrey[200],
        shape: CircleBorder(),
      ),
    );
  }

  Widget btnClear() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Icon(Icons.backspace, size: 35, color: Colors.white),
        onPressed: () {
          this.widget.presenter.onClearButtonClicked(textControllerInput.text);
        },
        color: Colors.blueGrey[900],
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }

  Widget btnAC(btntext, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(
              fontSize: 28.0, color: Colors.white, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          this.widget.presenter.onAcButtonClicked();
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }

  Widget btnEqual(btnText) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.transparent,
      elevation: 10.0,
      child: InkWell(
        onTap: () {
          this.widget.presenter.onEqualClicked(textControllerInput.text);
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(fontSize: 45, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }


}
