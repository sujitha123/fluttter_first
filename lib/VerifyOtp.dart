import 'package:flutter/material.dart';
import 'package:test_app/DashboardScreen.dart';

class VerifyOtp extends StatefulWidget {
  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(top: 40),
              child: Image.asset('assets/brandLogos/app_logo.png')),
          Text("Verify OTP",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          new Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 16),
            child: new TextFormField(
              maxLines: 1,
              maxLength: 6,
              decoration:
                  new InputDecoration(
                      hintText: 'Enter OTP',
                      contentPadding: const EdgeInsets.all(13)),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 36.0, right: 36.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: new MaterialButton(
                  padding: EdgeInsets.all(10.0),
                  child: Text("SUBMIT"),
                  color: Color.fromRGBO(35, 192, 103, 1),
                  textColor: Colors.white,
                  onPressed: () {
                    navigateToDashBoard();
                  }),
            ),
          ),
          new Container(
              margin: EdgeInsets.only(top: 36),
              child: Text("Resend",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)))
        ],
      ),
    ));
  }

  void navigateToDashBoard(){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
  }
}
