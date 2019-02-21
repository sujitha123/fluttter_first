import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMeeting extends StatefulWidget {
  @override
  _AddMeetingState createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  TextEditingController _meetingDateController = TextEditingController();
  TextEditingController _meetingTimeController = TextEditingController();
  DateTime selectedDate;
  TimeOfDay selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Meeting'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          hintText: 'Client Name',
                          contentPadding: const EdgeInsets.all(13)),
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }),
                ),
                Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.add,
                      size: 45.0,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: 'Mobile No',
                  contentPadding: const EdgeInsets.all(13)),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 5,
              decoration: new InputDecoration(
                  hintText: 'Location',
                  contentPadding: const EdgeInsets.all(13)),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            TextField(
              controller: _meetingDateController,
              decoration: new InputDecoration(labelText: "Meeting Date"),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _showDateTimePicker();
              },
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            TextField(
              controller: _meetingTimeController,
              decoration: new InputDecoration(labelText: "Meeting Time"),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _showTimePicker();
              },
            ),
            new Container(
              margin: EdgeInsets.only(top: 16.0, left: 36.0, right: 36.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: new MaterialButton(
                    child: Text("SUBMIT"),
                    color: Color.fromRGBO(35, 192, 103, 1),
                    textColor: Colors.white,
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDateTimePicker() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
    setState(() {
      selectedDate != null
          ? _meetingDateController.text =
              new DateFormat('dd/MM/yyyy').format(selectedDate)
          : DateFormat('dd/MM/yyyy').format(DateTime.now());
    });
  }

  _showTimePicker() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      if (selectedTime != null) {
        _meetingTimeController.text =
            TimeOfDay(hour: selectedTime.hour, minute: selectedTime.minute)
                .format(context);
      }
    });
  }
}
