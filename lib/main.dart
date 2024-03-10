import 'package:flutter/material.dart';
import 'package:flutter_test_sample/constants.dart';
import 'package:flutter_test_sample/logic.dart';
import 'package:flutter_test_sample/widgets/button.dart';
import 'package:flutter_test_sample/widgets/keyPads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //計算機に表示するテキスト
  String txtResult = "0";

  Logic _logic = Logic();

  @override
  Widget build(BuildContext context) {
    FunctionOnPressed onPress = (String text) {
      _logic.input(text);
      setState(() {
        txtResult = _logic.text;
      });
    };
    return Scaffold(
      backgroundColor: colorMain,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    txtResult,
                    key: Key("txtResult"),
                    style: const TextStyle(
                      color: colorText,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            KeyPad(onPress),
          ],
        ),
      ),
    );
  } // end of state class
}
