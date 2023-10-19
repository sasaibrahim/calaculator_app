import 'package:calulator_app/calc_btn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("calclator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      resultText,
                      style: TextStyle(fontSize: 20),
                    ))),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CalaculatorButton('9', onBtnclicked),
                  CalaculatorButton('8', onBtnclicked),
                  CalaculatorButton('7', onBtnclicked),
                  CalaculatorButton('/', onOperatedClicked)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CalaculatorButton('6', onBtnclicked),
                  CalaculatorButton('5', onBtnclicked),
                  CalaculatorButton('4', onBtnclicked),
                  CalaculatorButton('*', onOperatedClicked)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CalaculatorButton('3', onBtnclicked),
                  CalaculatorButton('2', onBtnclicked),
                  CalaculatorButton('1', onBtnclicked),
                  CalaculatorButton('-', onOperatedClicked)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CalaculatorButton('<', deleteNumber),
                  CalaculatorButton('0', onBtnclicked),
                  CalaculatorButton('=', onEqualclick),
                  CalaculatorButton('+', onOperatedClicked)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onEqualclick(text) {
    res = calculate(res, resultText, op);
    resultText = res;
    res = "";
    op = text;
    setState(() {});
  }

  void onBtnclicked(text) {
    if (op == "=") {
      resultText = text;
      op = "";
    } else {
      resultText += text;
    }
    setState(() {});
  }

  String res = "";
  String op = "";

  String calculate(String lhs, String rhs, String op) {
    int LHS = int.parse(lhs);
    int RHS = int.parse(rhs);
    if (op == "+") {
      return (LHS + RHS).toString();
    } else if (op == "-") {
      return (LHS - RHS).toString();
    } else if (op == "*") {
      return (LHS * RHS).toString();
    } else if (op == "/") {
      return (LHS / RHS).toString();
    }
    return "";
  }

  void onOperatedClicked(text) {
    if (op.isEmpty) {
      res = resultText;
    } else {
      res = calculate(res, resultText, op);
    }
    op = text;
    resultText = "";
    setState(() {});
  }

  void deleteNumber(text) {
    String newtext = resultText;
    if (newtext.isNotEmpty) {
      resultText = newtext.substring(0, newtext.length - 1);
    }
    setState(() {});
  }
}
