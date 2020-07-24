import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectmanager/login/Staff_AC.dart';
import '../Widgets/authentication.dart';
import 'Staff_Signup.dart';

class StaffLogin extends StatefulWidget {
  static const routeName = '/staff-login';

  @override
  _StaffLoginState createState() => _StaffLoginState();
}

class _StaffLoginState extends State<StaffLogin> {
  final _formKey = new GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email1 = "";
  String pass1 = "";
  String error = "";
  String cPass = "";
  String verify = "";

  TextEditingController _email = TextEditingController();
  TextEditingController _password1 = TextEditingController();

  String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.black12,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 45, 15, 25),
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
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  SingleChildScrollView(
                    child: new Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 5, 30, 15),
                              child: TextFormField(
                                controller: _email,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter the email' : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 32,
                                    color: Colors.black,
                                  ),
                                  labelText: "User-Id",
                                  labelStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                              child: TextFormField(
                                controller: _password1,
                                validator: (val) => val.length < 6
                                    ? 'Password too short.'
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock,
                                      size: 30, color: Colors.black),
                                  labelText: 'Password',
                                  labelStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
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
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    AuthResult authResult = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                      email: "thegreatrebal@gmail.com",
                                      password: "1234567",
                                    );

                                    if (authResult == null) {
                                      print('Login Failed !');
                                    } else {
                                      FirebaseUser user = authResult.user;
                                      //TODO, store user data in shared prefs
                                      print(user.uid);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => StaffAC(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't Have An Account.?",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).popAndPushNamed(
                                          StaffSignup.routeName1);
                                    },
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        )),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    iconSize: 20,
                    splashColor: Colors.white70,
                    onPressed: () {
                      Navigator.pop(context, true);
                      //Navigator.of(context).popAndPushNamed(Login.routeNames);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
