import 'package:flutter/foundation.dart';


class User{
  final String aYear;
  final String pname;
  final String name1, name2 , name3;
  final String sem;
  final String year;

  User({
    @required this.aYear,
    @required this.pname,
    this.year,
    @required this.sem,
    @required this.name1,
    @required this.name2,
    @required this.name3,
  });

}

