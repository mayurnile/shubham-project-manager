import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class StudSignup extends StatefulWidget {
  static const routeName2 = '/Stud-login';
  @override
  _StudSignupState createState() => _StudSignupState();
}

class _StudSignupState extends State<StudSignup> {

  final TextEditingController email = new TextEditingController();
  final TextEditingController pass = new TextEditingController();
  final TextEditingController conPass = new TextEditingController();
  final TextEditingController verification = new TextEditingController();


  bool _validate = false;
  bool _validate1 = false; 
  bool _validate2 = false;
  bool _validate3 = false;

  @override
  Widget build(BuildContext context) {
    

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
                    child: Text("Sign-up",
                      style: TextStyle(
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
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      errorText: _validate ? 'Fill The Values' : null,
                      errorBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.5,
                        )
                      ),
                      prefixIcon: Icon(Icons.person , size: 32,color: Colors.black,),
                      labelText: "Enter email",
                      labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30,0),
                  child: TextField(
                    controller: pass,
                    decoration:  InputDecoration(
                      errorText: _validate1? 'Fill The Values' : null,
                      errorBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.5,
                        )
                      ),
                      prefixIcon: Icon(Icons.lock_outline , size: 30,color: Colors.black),
                        labelText: 'Password',
                        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                        ),

                    //validator: (val) => val.length < 6 ? 'Password too short.' : null,
                    //onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30,0),
                  child: TextField(
                    controller: conPass,
                    decoration:  InputDecoration(
                      errorText: _validate2? 'Fill The Values' : null,
                      errorBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.5,
                        )
                      ),
                      prefixIcon: Icon(Icons.lock , size: 30,color: Colors.black),
                        labelText: 'Confirm Password',
                        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                        ),
                    //validator: (val) => val.length < 6 ? 'Password too short.' : null,
                    //onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 15),

                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30,0),
                  child: TextField(
                    controller: verification,
                    decoration: InputDecoration(
                      errorText: _validate3? 'Fill The Values' : null,
                      errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
                      prefixIcon: Icon(Icons.vpn_key , size: 30,color: Colors.black),
                        labelText: 'Verification',
                        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                        ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
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
                      child: Text("Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        
                        print(email);
                        print(pass);
                        print(conPass);
                        print(verification);

                        setState(() {
                        } );
                      },
                    ),
                  ),
                ),

                BackButton(

                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            ],
        ),
      ),
    );
  }
}
