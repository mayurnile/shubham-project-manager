import 'package:flutter/material.dart';
import 'package:projectmanager/Widgets/authentication.dart';

class StaffAC extends StatefulWidget {
  
  @override
  _StaffACState createState() => _StaffACState();
}

class _StaffACState extends State<StaffAC> {

  bool isExpanded = true;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    DateTime(2019);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Staff Desk",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).appBarTheme.textTheme.headline1.color,
          ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.exit_to_app), 
            onPressed: ()async{
              await _auth.signOut();
            })
          ],
        ),

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
            Container(
              child: Text("hw"),
            )
            
          ],
        ),
      ),
    );
  }
}