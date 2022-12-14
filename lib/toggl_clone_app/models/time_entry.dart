

import './project.dart';
import 'package:intl/intl.dart';

class TimeEntry {
  DateTime startTime;
  String description;
  DateTime? endTime;
  Project? project;

  double get duration {
    return (endTime ?? DateTime.now()).difference(startTime).inMinutes / 60;
  }
  double get cost {
    return duration * (project?.hourRate ?? 0);
  }
  String get formattedDuration {
    var duration = (endTime ?? DateTime.now()).difference(startTime);
    var hours = duration.inHours;
    var minutes = duration.inMinutes % 60;
    var seconds = duration.inSeconds % 60;

    return "${NumberFormat("00").format(hours)}:${NumberFormat("00").format(minutes)}:${NumberFormat("00").format(seconds)}";
  }

  static final dummyEntries = [
    new TimeEntry(
      DateTime.now().subtract(Duration(days: 1, hours: 1)),
      "Do Some Thing",
      endTime: DateTime.now().subtract(Duration(hours: 22, minutes: 30)),
      project: Project.dummyProjects[0]
    ),
    new TimeEntry(
      DateTime.now().subtract(Duration(days: 2, hours: 1)),
      "Do Some Thing",
      endTime: DateTime.now().subtract(Duration(hours: 22 * 2)),
      project: Project.dummyProjects[1]
    ),
    new TimeEntry(
      DateTime.now().subtract(Duration(days: 1, hours: 12)),
      "Do Some Thing",
      endTime: DateTime.now().subtract(Duration(days: 1, hours: 10, minutes: 30)),
      project: Project.dummyProjects[0]
    ),
    new TimeEntry(
      DateTime.now().subtract(Duration(days: 1, hours: 4)),
      "Do Some Thing",
      endTime: DateTime.now().subtract(Duration(hours: 24, minutes: 30)),
      project: Project.dummyProjects[1]
    ),
  ];

  TimeEntry(this.startTime, this.description, {this.endTime, this.project});


}