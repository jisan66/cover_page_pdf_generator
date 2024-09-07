class Assignment {
  String assignmentTitle;
  String courseCode;
  String courseName;
  String submittedByLevel;
  String submittedByName;
  String submittedBySemester;
  String submittedToName;

  Assignment({
    required this.assignmentTitle,
    required this.courseCode,
    required this.courseName,
    required this.submittedByLevel,
    required this.submittedByName,
    required this.submittedBySemester,
    required this.submittedToName,
  });

  // fromJson method
  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      assignmentTitle: json['assignmentTitle'] as String,
      courseCode: json['courseCode'] as String,
      courseName: json['courseName'] as String,
      submittedByLevel: json['submittedByLevel'] as String,
      submittedByName: json['submittedByName'] as String,
      submittedBySemester: json['submittedBySemester'] as String,
      submittedToName: json['submittedToName'] as String,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'assignmentTitle': assignmentTitle,
      'courseCode': courseCode,
      'courseName': courseName,
      'submittedByLevel': submittedByLevel,
      'submittedByName': submittedByName,
      'submittedBySemester': submittedBySemester,
      'submittedToName': submittedToName,
    };
  }
}
