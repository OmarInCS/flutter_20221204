
import 'package:app20221204/toggl_clone_app/models/time_entry.dart';
import 'package:app20221204/toggl_clone_app_db/screens/add_entry_screen.dart';
import 'package:app20221204/toggl_clone_app/widgets/app_bottom_sheet.dart';
import 'package:app20221204/toggl_clone_app/widgets/time_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../widgets/app_drawer.dart';

class TogglHomeScreen extends StatefulWidget {
  TogglHomeScreen({Key? key, this.runningEntry}) : super(key: key);
  TimeEntry? runningEntry;

  @override
  State<TogglHomeScreen> createState() => _TogglHomeScreenState();
}

class _TogglHomeScreenState extends State<TogglHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: GroupedListView(
        elements: TimeEntry.dummyEntries,
        groupBy: (element) => DateFormat.yMMMd().format(element.startTime),
        itemBuilder: (context, element) => TimeEntryCard(element),
        groupSeparatorBuilder: (value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(widget.runningEntry == null ? Icons.add : Icons.stop),
        onPressed: () async {
          if (widget.runningEntry == null) {
            await Navigator.push(context, MaterialPageRoute(builder: (context) => AddEntryScreen(),));
          }
          else {
            widget.runningEntry!.endTime = DateTime.now();
            TimeEntry.dummyEntries.add(widget.runningEntry!);
            widget.runningEntry = null;
          }
          setState(() {

          });
        },
      ),
      bottomSheet: widget.runningEntry != null ? AppBottomSheet(widget.runningEntry!) : null,
    );
  }
}
