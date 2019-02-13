import 'package:flutter/material.dart';
import 'package:test_app/VerifyOtp.dart';

class MobileVerification extends StatefulWidget {
  @override
  _MobileVerificationState createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Verify Mobile",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            new Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Please enter your mobile number",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center),
            ),
            new Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(top: 36),
                child: Image.asset('assets/brandLogos/app_logo.png')),
            new Container(
              child: Column(
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.only(
                          top: 50.0, right: 36.0, left: 36.0, bottom: 0.0),
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                              flex: 1,
                              child: new Container(
                                margin: EdgeInsets.only(right: 5),
                                child: new TextFormField(
                                  enabled: false,
                                  initialValue: "+91",
                                  decoration: new InputDecoration(
                                      contentPadding: const EdgeInsets.all(13)),
                                ),
                              )),
                          new Expanded(
                              flex: 4,
                              child: new TextFormField(
                                decoration: new InputDecoration(
                                    hintText: 'Mobile',
                                    contentPadding: const EdgeInsets.all(13)),
                              ))
                        ],
                      )),
                  new Container(
                    margin: EdgeInsets.only(left: 36.0, right: 36.0, top: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: new MaterialButton(
                          padding: EdgeInsets.all(10.0),
                          child: Text("GENERATE OTP"),
                          color: Color.fromRGBO(35, 192, 103, 1),
                          textColor: Colors.white,
                          onPressed: () {
                            navigateToOtpPage();
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToOtpPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => VerifyOtp()));
  }
}
