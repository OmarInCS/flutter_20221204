
import 'dart:math';

import 'package:app20221204/toggl_clone_app/models/project.dart';
import 'package:app20221204/toggl_clone_app/models/time_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {

  var _timeEntry = TimeEntry(DateTime.now(), "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: GestureDetector(
                child: Text(
                  DateFormat("MMM, dd").format(_timeEntry.startTime),
                  style: TextStyle(fontSize: 36),
                ),
                onTap: _selectStartDate,
              ),
              trailing: GestureDetector(
                child: Text(
                  DateFormat("HH:mm").format(_timeEntry.startTime),
                  style: TextStyle(fontSize: 36),
                ),
                onTap: _selectStartTime,
              ),
            ),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                labelText: "Description"
              ),
              onChanged: (value) => _timeEntry.description = value,
            ),
            SizedBox(height: 8,),
            DropdownButtonFormField(
              items: [
                for (var p in Project.dummyProjects)
                  DropdownMenuItem(
                    child: Text(p.projectName),
                    value: p,
                  )
              ],
              onChanged: (value) => _timeEntry.project = value,
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {

            },
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _selectEndTime,
          ),
        ],
      ),
    );
  }

  void _selectStartDate() async {

    var date = await showDatePicker(
      context: context,
      initialDate: _timeEntry.startTime,
      firstDate: DateTime.now().subtract(Duration(days: 7)),
      lastDate: DateTime.now(),
      helpText: "Start Date"
    );

    if (date != null) {
      _timeEntry.startTime = DateTime(
        date.year, date.month, date.day,
        _timeEntry.startTime.hour, _timeEntry.startTime.minute
      );

      setState(() {

      });
    }

  }

  void _selectStartTime() async {

    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Start Time"
    );

    if (time != null) {
      _timeEntry.startTime = DateTime(
        _timeEntry.startTime.year, _timeEntry.startTime.month, _timeEntry.startTime.day,
        time.hour, time.minute
      );

      setState(() {

      });
    }

  }

  void _selectEndTime() async {

    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        helpText: "End Time"
    );

    if (time != null) {
      _timeEntry.endTime = DateTime(
          _timeEntry.startTime.year, _timeEntry.startTime.month, _timeEntry.startTime.day,
          time.hour, time.minute
      );

      TimeEntry.dummyEntries.add(_timeEntry);
      Navigator.pop(context);
    }

  }
}
