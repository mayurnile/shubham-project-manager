
import 'package:flutter/material.dart';
import 'package:projectmanager/login/Staff_Login.dart';
import 'package:projectmanager/login/Stud_Login.dart';
import 'package:projectmanager/project/Projects_List.dart';

class Login extends StatefulWidget {

  static const routeNames = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(

      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              // color: Colors.black12,
              child: Container(
                margin:EdgeInsets.fromLTRB(20,45, 15 , 15),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(125),
                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Text("HOME",
                        style: TextStyle(
                          //color: Colors.black87,
                          fontWeight: FontWeight.w900,
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight/5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: Colors.black12,
                      elevation: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 12,
                            offset: Offset(12,10),
                          )]
                        ),
                        height: 60,
                          width: 200,
                          child: RaisedButton(
                            color: Colors.transparent,
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => StaffLogin()));
                            },
                            child: Text('Staff',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                            ),)
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                      color: Colors.black12,
                      elevation: 6,
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 12,
                                offset: Offset(12,10),
                              )]
                          ),
                          height: 60,
                          width: 200,
                          child: RaisedButton(
                            color: Colors.transparent,
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => StudLogin()));
                            },
                            child: Center(
                              child: Text('Student',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                              ),
                            ),)
                      ),
                    ),
                    SizedBox(height: 30),
                    Card(
                      color: Colors.black12,
                      elevation: 6,
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 12,
                                offset: Offset(12,10),
                              )]
                          ),
                          height: 90,
                          width: 200,
                          child: RaisedButton(
                              color: Colors.black12,
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProjectsList()));
                              },
                              child: Text('Previous Projects',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                ),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
