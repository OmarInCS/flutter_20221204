
import 'package:app20221204/toggl_clone_app/models/time_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeEntryCard extends StatelessWidget {
  const TimeEntryCard(this.entry, {Key? key}) : super(key: key);
  final TimeEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(entry.description),
        subtitle: Text(entry.project?.projectName ?? "No Project"),
        trailing: Text(
          NumberFormat.currency(symbol: "SAR ").format(entry.cost)
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              DateFormat.Hm().format(entry.startTime)
            ),
            Text(
              DateFormat.Hm().format(entry.endTime ?? DateTime.now())
            ),

          ],
        ),
      ),
    );
  }
}
