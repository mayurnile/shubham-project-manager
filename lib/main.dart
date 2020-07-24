import 'package:flutter/material.dart';
import 'package:projectmanager/login/Staff_Login.dart';
import 'login/Login.dart';
import 'login/Stud_Signup.dart';
import 'login/Staff_Login.dart';
import 'login/Staff_Signup.dart';
import 'project/Projects_List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              headline2: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
              headline3: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              )),
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.black12,
              actionsIconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(
                  headline1: TextStyle(
                color: Colors.black,
              ))),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 3,
              color: Colors.black87,
            )),
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.5,
              ),
            ),
          )),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline2: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60),
              headline3: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              )),
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.black12,
              actionsIconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(
                  headline1: TextStyle(
                color: Colors.white,
              ))),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 3,
              color: Colors.black87,
            )),
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.5,
              ),
            ),
          )),
      home: Login(),
      routes: <String, WidgetBuilder>{
        StaffLogin.routeName: (BuildContext context) => StaffLogin(),
        StaffSignup.routeName1: (BuildContext context) => StaffSignup(),
        // StudSignup.routeName1 : (BuildContext context) => StudSignup(),
        // ProjectsList.routeName2 :(BuildContext context)=> ProjectsList(),
        Login.routeNames: (BuildContext context) => Login(),
      },
    );
  }
}
