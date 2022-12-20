
import 'dart:async';

import 'package:app20221204/toggl_clone_app/models/time_entry.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet(this.runningEntry, {Key? key}) : super(key: key);
  final TimeEntry runningEntry;

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {

  var _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      setState(() {

      });

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 8,
      onClosing: () {

      },
      builder: (context) => ListTile(
        title: Text(
          widget.runningEntry.description
        ),
        subtitle: Text(
          widget.runningEntry.project?.projectName ?? "No Project"
        ),
        leading: Text(
          widget.runningEntry.formattedDuration,
          style: TextStyle(
            fontSize: 24
          ),
        ),
      ),
    );
  }
}
