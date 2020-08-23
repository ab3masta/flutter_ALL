double calculator(double value1, double value2, String symbole) {
  double result;
  if (symbole == "+") {
    result = value1 + value2;
  } else if (symbole == "-") {
    result = value1 - value2;
  } else if (symbole == "x") {
    result = value1 * value2;
  } else if (symbole == "/") {
    result = value1 / value2;
  }
  return result;
}
