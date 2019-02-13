import 'package:flutter/material.dart';
import '../DashboardScreen.dart' as dashBoardObj;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Text('WELCOME TO',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Travelize',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(35, 192, 103, 1),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 80),
                    child: new MaterialButton(
                        padding: EdgeInsets.all(10.0),
                        child: Text("CHECK-IN"),
                        color: Color.fromRGBO(35, 192, 103, 1),
                        textColor: Colors.white,
                        onPressed: () {}),
                  ),
                  Center(child: _cardView()),
                  new Container(
                    margin: EdgeInsets.all(10),
                    child: new MaterialButton(
                        padding: EdgeInsets.all(10.0),
                        child: Text("MY VISIT"),
                        color: Color.fromRGBO(35, 192, 103, 1),
                        textColor: Colors.white,
                        onPressed: () {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _lineView() {
    return new Container(
      height: 1.5,
      margin: EdgeInsets.all(5),
      color: const Color.fromRGBO(195, 195, 195, 1),
    );
  }

  Widget _cardView() {
    return Card(
        margin: EdgeInsets.only(top: 40, right: 40, left: 40),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 26),
                    child: Image.asset('assets/brandLogos/app_logo.png'))
              ],
            ),
            _lineView(),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    ' 0 meetings',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(35, 192, 103, 1)),
                  ),
                  Text(
                    ' today',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            _lineView(),
            new Container(
              margin: EdgeInsets.all(5),
              child: new MaterialButton(
                  child: Text("VIEW"),
                  color: Color.fromRGBO(35, 192, 103, 1),
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      print(
                          '----dddddddddd------------clicked----------------');
                      dashBoardObj.DashboardScreen d =
                          new dashBoardObj.DashboardScreen();
                      d.createState().pageController.animateToPage(2,
                          duration: Duration(milliseconds: 300),
                          curve: Cubic(1, 1, 1, 1));
                    });
                  }),
            ),
          ],
        ));
  }
}
