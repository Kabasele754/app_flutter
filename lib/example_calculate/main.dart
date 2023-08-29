import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'calculate': (context) => CalculatorApplication(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/67704765?v=4'),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent])),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.calculate,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'calculate');
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "Galery",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.photo_album,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorApplication extends StatefulWidget {
  const CalculatorApplication({super.key});

  @override
  State<CalculatorApplication> createState() => _CalculatorApplicationState();
}

class _CalculatorApplicationState extends State<CalculatorApplication> {
  var result = '0';
  var inputUser = '';

  void buttonPressed(String text) {
    setState(() {
      inputUser = inputUser + text;
    });
  }

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {
            if (text1 == 'AC') {
              setState(() {
                inputUser = '';
                result = '0';
              });
            } else {
              buttonPressed(text1);
            }
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text1),
          child: Text(
            text1,
            style: TextStyle(
                color: getTextColor(text1),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text2 == 'Del') {
              setState(() {
                if (inputUser.length > 0) {
                  inputUser = inputUser.substring(
                    0,
                    inputUser.length - 1,
                  );
                }
              });
            } else {
              buttonPressed(text2);
            }
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text2),
          child: Text(
            text2,
            style: TextStyle(
                color: getTextColor(text2),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            buttonPressed(text3);
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text3),
          child: Text(
            text3,
            style: TextStyle(
                color: getTextColor(text3),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text4 == '=') {
              Parser parser = Parser();
              String finaluserinput = inputUser;
              finaluserinput = inputUser.replaceAll('X', '*');
              Expression expression = parser.parse(finaluserinput);
              ContextModel contextModel = ContextModel();
              double eval =
                  expression.evaluate(EvaluationType.REAL, contextModel);

              setState(() {
                result = eval.toString();
              });
            } else {
              buttonPressed(text4);
            }
          },
          elevation: 2.0,
          fillColor: kAmber,
          child: Text(
            text4,
            style: TextStyle(
                fontSize: 40, color: kWhite, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          inputUser,
                          style: TextStyle(
                            color: kLightGray,
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                            color: kLightGray,
                            fontSize: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            result,
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 65,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    getRow('AC', 'Del', '%', '/'),
                    getRow('1', '2', '3', 'X'),
                    getRow('4', '5', '6', '-'),
                    getRow('7', '8', '9', '+'),
                    getRow('00', '0', '.', '='),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isOprator(String text) {
    var list = ['AC', 'Del', '%', 'X'];

    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOprator(text)) {
      return kLightGray;
    } else {
      return kDarkGray;
    }
  }

  // bool TextOprator(String text) {
  //   var list = ['AC', 'Del', '%', 'X'];

  //   for (var item in list) {
  //     if (text == item) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  Color getTextColor(String text) {
    if (isOprator(text)) {
      return Colors.black;
    } else {
      return kWhite;
    }
  }
}
