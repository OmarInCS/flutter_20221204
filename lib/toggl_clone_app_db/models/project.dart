

class Project {
  int? projectId;
  String projectName;
  String? clientName;
  int hourRate;

  Project({this.projectId, required this.projectName, this.clientName, this.hourRate=0});

  Project.fromMap(Map<String, dynamic> map)
      : this(
    projectName: map["projectName"],
    projectId: map["projectId"],
    clientName: map["clientName"],
    hourRate: map["hourRate"],
  );

  Map<String, dynamic> toMap() {
    return {
      "projectId": projectId,
      "projectName": projectName,
      "clientName": clientName,
      "hourRate": hourRate,
    };
  }
}