import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectmanager/Widgets/authentication.dart';

class StaffSignup extends StatefulWidget {
  static const routeName1 = '/staff-login';

  @override
  _StaffSignupState createState() => _StaffSignupState();
}

class _StaffSignupState extends State<StaffSignup> {

  final _formKey = new GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  String email1 ="";
  String pass1="";
  String cPass ="";
  String verify="";
  String error="";

    String _password;
  

  final TextEditingController email = new TextEditingController();
  final TextEditingController pass = new TextEditingController();
  final TextEditingController conPass = new TextEditingController();
  final TextEditingController verification = new TextEditingController();

  
  bool _validate = false, _validate1 = false, _validate2 = false, _validate3 = false;

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
                SingleChildScrollView(
                  child: new Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                    margin: EdgeInsets.fromLTRB(30, 5, 30,15),
                    child: TextFormField(
                      controller: email,

                      validator: (val)=>val.isEmpty?'Enter an Email':null,
                      onChanged: (val){
                        setState(() {
                          email1 =val;
                        });
                      },
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
                    child: TextFormField(
                      validator: (val)=>val.length<6 ?'Enter a pass of 6+ char':null,
                      onChanged: (val){

                        setState(() {
                          pass1 =val;
                        });
                      },
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
                    child: TextFormField(
                      controller: conPass,
                      validator: (val)=>val.length<6 ?'Renter a pass':null,
                      onChanged: (val){
                         cPass=val;
                      },
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
                    child: TextFormField(
                      validator: (val)=>val.length<4 ?'Enter verification':null,
                      onChanged: (val){
                        setState(() {
                          verify =val;
                        });
                      },
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
                        onPressed: () async{
                          
                          if(_formKey.currentState.validate()){
                            
                            dynamic result =await _auth.registerWithEmailAndPassword(email1, pass1, cPass, verify);

                            if(result ==null){
                              setState(() {
                                error ="Please Give valid Email";
                              });
                            }
                            
                          }
                        },
                      ),
                      
                    ),
                ),
                  SizedBox(height: 12),
                  Text(error,
                    style: TextStyle(color: Colors.red)
                  ),
                      ],
                    ),
                  ),
                ),

                BackButton(
                  onPressed: (){
                    Navigator.pop(context , true);
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
