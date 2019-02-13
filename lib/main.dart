import 'package:flutter/material.dart';
import 'package:test_app/MobileVerification.dart';
import 'dart:async';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
      theme: ThemeData(
          primaryColor: Color.fromRGBO(79, 79, 79, 1),
          accentColor: Color.fromRGBO(35, 192, 103, 1),
        primaryColorDark: Color.fromRGBO(79, 79, 79, 1),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(10.0),
          height: 50,
          buttonColor: Color.fromRGBO(35, 192, 103, 1),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/mobileVerify': (BuildContext context) => new MobileVerification(),
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, gotoMobileVerificationScreen);
  }

  @override
  Widget build(BuildContext context) {
    startTime();
    return Container(
      color: Color(0xFFFFFFFF),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(80),
              //padding: EdgeInsets.all(80.0),
              child: Image.asset('assets/brandLogos/travelize_logo.png'),
            )
          ],
        ),
      ),
    );
  }

  void gotoMobileVerificationScreen() {
    Navigator.pushReplacementNamed(context, '/mobileVerify');
  }
}
