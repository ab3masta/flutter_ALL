import 'package:math_expressions/math_expressions.dart';

String btnEqual(String inputValue) {
  Parser p = new Parser();
  ContextModel cm = new ContextModel();
  Expression exp = p.parse(inputValue);

  return exp.evaluate(EvaluationType.REAL, cm).toString();
}
