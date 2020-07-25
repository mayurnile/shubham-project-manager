import 'package:flutter/foundation.dart';

class Project {
  final String academicYear;
  final String memberOne;
  final String memberTwo;
  final String memberThree;
  final String sem;
  final String year;
  final String projectTopic;

  Project({
    @required this.academicYear,
    @required this.memberOne,
    @required this.memberTwo,
    @required this.memberThree,
    @required this.sem,
    @required this.year,
    @required this.projectTopic,
  });

  static Project fromJSON(Map<dynamic, dynamic> project) {
    final String academicYear = project['Acadmic year'];
    final String memberOne = project['Member1'];
    final String memberTwo = project['Member2'];
    final String memberThree = project['Member3'];
    final String sem = project['Sem'];
    final String year = project['Year'];
    final String projectTopic = project['projtopic'];

    final Project newProject = Project(
      academicYear: academicYear,
      memberOne: memberOne,
      memberTwo: memberTwo,
      memberThree: memberThree,
      sem: sem,
      year: year,
      projectTopic: projectTopic,
    );

    return newProject;
  }
}
