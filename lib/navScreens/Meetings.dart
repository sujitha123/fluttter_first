import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:test_app/models/MeetingModel.dart';
import '../AddActs/AddMeeting.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

class Meetings extends StatefulWidget {
  @override
  _MeetingsState createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  TextEditingController _textEditingController = TextEditingController();
  DateTime selected;
  List<MeetingModel> _listMeetingsGlobal = new List();

  @override
  void initState() {
    super.initState();
    _textEditingController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    callMeetingsDataToDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddMeeting()));
          }),
      body: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        child: Column(
          children: <Widget>[
            new TextField(
              controller: _textEditingController,
              decoration: new InputDecoration(labelText: "To Date"),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _showDateTimePicker();
              },
            ),
            new Expanded(
              child: RefreshIndicator(
                //key: _refreshIndicatorKey,
                onRefresh: () {
                  callMeetingsDataToDownload();
                },
                child: ListView.builder(
                    itemCount: _listMeetingsGlobal.length,
                    itemBuilder: (context, index) {
                      if (_listMeetingsGlobal[0].Success != 0) {
                        return MeetingRow(_listMeetingsGlobal[index]);
                      } else
                        return Center(
                          child: Text(_listMeetingsGlobal[0].Msg),
                        );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
    setState(() {
      selected != null
          ? _textEditingController.text =
              new DateFormat('dd/MM/yyyy').format(selected)
          : DateFormat('dd/MM/yyyy').format(DateTime.now());
      callMeetingsDataToDownload();
    });
  }

  Future<List<MeetingModel>> getMeetingListFromServer(String toDate) async {
    List<MeetingModel> listMeetings = new List();
    String url = "http://192.168.1.235/api/user/PostMeetingCount/";

    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };

    Map<String, String> body = {'UserId': 'USR002', 'FromDate': toDate};

    var response = await http.post(Uri.encodeFull(url),
        headers: requestHeaders, body: body);
    var meetingJsonDecode = jsonDecode(response.body);

    print('--------${meetingJsonDecode}');

    for (var mt in meetingJsonDecode) {
      MeetingModel meetingModel = MeetingModel.fromMap(mt);

      listMeetings.add(meetingModel);
    }
    return listMeetings;
  }

  void callMeetingsDataToDownload() {
    _refreshIndicatorKey.currentState.show();
    getMeetingListFromServer(_textEditingController.text).then((res) {
      setState(() {
        _listMeetingsGlobal.clear();
        _listMeetingsGlobal.addAll(res);
//        _refreshIndicatorKey.currentState.;
      });
    });
  }
}

class MeetingRow extends StatelessWidget {
  final MeetingModel _meetingModel;

  MeetingRow(this._meetingModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            _meetingModel.OnTime,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          radius: 30,
          backgroundColor: Color.fromRGBO(35, 192, 103, 1),
        ),
        title: Text(_meetingModel.FullName),
        subtitle: Text(_meetingModel.Status),
      ),
    );
  }
}

/*Future<List<MeetingModel>> getMeetingListFromServer(String toDate) async {
  List<MeetingModel> listMeetings = new List();
  String url = "http://192.168.1.235/api/user/PostMeetingCount/";

  Map<String, String> requestHeaders = {
    'Content-type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };

  Map<String, String> body = {'UserId': 'USR002', 'FromDate': toDate};

  var response = await http.post(Uri.encodeFull(url),
      headers: requestHeaders, body: body);
  var meetingJsonDecode = jsonDecode(response.body);

  print('--------${meetingJsonDecode}');

  for (var mt in meetingJsonDecode) {
    MeetingModel meetingModel = MeetingModel.fromMap(mt);

    listMeetings.add(meetingModel);
  }
  return listMeetings;
}*/

/*new Expanded(
                child: new FutureBuilder(
              future: getMeetingListFromServer(_textEditingController.text),
              builder: (BuildContext context, AsyncSnapshot snapShot) {
                if (snapShot.data == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text('Loading....'),
                      )
                    ],
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () {
                      setState(() {
                        getMeetingListFromServer(_textEditingController.text);
                      });
                    },
                    child: ListView.builder(
                        itemCount: snapShot.data.length,
                        itemBuilder: (context, index) {
                          if (snapShot.data[0].Success != 0) {
                            return MeetingRow(snapShot.data[index]);
                          } else
                            return Center(
                              child: Text(snapShot.data[0].Msg),
                            );
                        }),
                  );
                }
              },
            ))*/
