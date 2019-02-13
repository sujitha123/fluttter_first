import 'package:flutter/material.dart';
import 'package:test_app/navScreens/Bussiness.dart';
import 'package:test_app/navScreens/Claims.dart';
import 'package:test_app/navScreens/DirectVisit.dart';
import 'package:test_app/navScreens/Home.dart';
import 'package:test_app/navScreens/Meetings.dart';


class DashboardScreen extends StatefulWidget {
  DashboardScreen({ Key key }) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String appBarTitle = "Home";
  int _currentIndex = 0;
  int get createdObject => _currentIndex;

  final List<Widget> _children = [
    Home(),
    Meetings(),
    DirectVisit(),
    Bussiness(),
    Claims()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 300), curve: Cubic(1, 1, 1, 1));
//      pageController.jumpToPage(_currentIndex);
      switch (index) {
        case 0:
          appBarTitle = "Home";
          break;
        case 1:
          appBarTitle = "Meetings";
          break;
        case 2:
          appBarTitle = "Direct Visit";
          break;
        case 3:
          appBarTitle = "Bussiness";
          break;
        case 4:
          appBarTitle = "Claims";
          break;
      }
    });
  }

  PageView pageView;
  PageController pageController;

  @override
  Widget build(BuildContext context) {

    pageController=new PageController();

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
//      body: _children[_currentIndex],
      body: pageView= new PageView(
          physics:new NeverScrollableScrollPhysics(),
          children: [
            Home(),
            Meetings(),
            DirectVisit(),
            Bussiness(),
            Claims()
          ],
          controller: pageController,
      ),
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(79, 79, 79, 1),
            primaryColor: Color.fromRGBO(35, 192, 103, 1),
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              activeIcon: new Icon(
                Icons.home,
                color: Color.fromRGBO(35, 192, 103, 1),
              ),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.card_travel),
              activeIcon: new Icon(
                Icons.card_travel,
                color: Color.fromRGBO(35, 192, 103, 1),
              ),
              title: new Text('Meetings'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.location_city),
              activeIcon: new Icon(
                Icons.location_city,
                color: Color.fromRGBO(35, 192, 103, 1),
              ),
              title: new Text('Direct Visit'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.business_center),
              activeIcon: new Icon(
                Icons.business_center,
                color: Color.fromRGBO(35, 192, 103, 1),
              ),
              title: new Text('Bussiness'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.attach_money),
              activeIcon: new Icon(
                Icons.attach_money,
                color: Color.fromRGBO(35, 192, 103, 1),
              ),
              title: new Text('Claims'),
            ),
          ],
        ),
      ),
    );
  }
}
