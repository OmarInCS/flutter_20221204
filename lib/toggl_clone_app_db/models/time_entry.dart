


import 'package:intl/intl.dart';

import 'project.dart';

class TimeEntry{
  int? entryId;
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

  TimeEntry({this.entryId, required this.startTime, required this.description, this.endTime, this.project});

  TimeEntry.fromMap(Map<String, dynamic> res)
      : this(
    startTime: DateFormat("yyyy-MM-dd hh:mm").parse(res["startTime"]),
    entryId: res["entryId"],
    description: res["description"],
    endTime: DateFormat("yyyy-MM-dd hh:mm").parse(res["endTime"]),
    project: res["project"],
  );

  Map<String, dynamic> toMap() {
    return {
      "projectId": project?.projectId,
      "entryId": entryId,
      "startTime": DateFormat("yyyy-MM-dd HH:mm").format(startTime),
      "description": description,
      "endTime": endTime != null? DateFormat("yyyy-MM-dd HH:mm").format(endTime!) : null,
    };
  }


}