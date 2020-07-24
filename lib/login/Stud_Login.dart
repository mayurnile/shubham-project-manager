import 'package:flutter/material.dart';
import 'package:projectmanager/login/Stud_Signup.dart';
import 'package:projectmanager/project/Project_submission.dart';




class StudLogin extends StatefulWidget {
  @override
  _StudLoginState createState() => _StudLoginState();
}

class _StudLoginState extends State<StudLogin> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

  final TextEditingController email = new TextEditingController();
  final TextEditingController pass = new TextEditingController();


    String _password;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Container(
                margin:EdgeInsets.fromLTRB(20,45, 15 , 25),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(125),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Text("Login",
                        style: TextStyle(
                          //color: Colors.black87,
                          fontWeight: FontWeight.w900,
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 80),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30,15),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person , size: 32,color: Colors.black,),
                      labelText: "User-Id",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ) ,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.black87,
                          )
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30,0),
                  child: TextFormField(
                    controller: pass,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock , size: 30,color: Colors.black),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ) ,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.black87,
                          )
                      ),
                    ),
                    validator: (val) => val.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Card(
                    color: Colors.transparent,
                    child: RaisedButton(
                      splashColor: Colors.black54,
                      elevation: 5.0,
                      color: Colors.black54,
                      child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProjectSubmission()));
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't Have An Account.?",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    FlatButton(
                        onPressed: (){
                          Navigator.of(context).popAndPushNamed(StudSignup.routeName2);
                        },
                        child: Text("SIGN UP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ))
                  ],
                ),
              ],
            ),

            Positioned(
              right: screenWidth/1.17,
              top: screenHeight/1.13,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white70,
                  iconSize: 40,
                  onPressed: (){
                    Navigator.of(context).pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
