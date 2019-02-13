import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Meetings extends StatefulWidget {
  @override
  _MeetingsState createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  TextEditingController _textEditingController = TextEditingController();
  DateTime selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text=DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              new DateFormat('dd-MM-yyyy').format(selected)
          : "";
    });
  }
}
