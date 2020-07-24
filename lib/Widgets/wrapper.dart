import 'package:flutter/material.dart';
import 'package:projectmanager/login/Staff_AC.dart';
import 'User1.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1>(context);
  print (user);

  return StaffAC();

    // if(user == null){
    //   return StaffLogin();
    // }else{
    //   return StaffAC();
    // }
  }
}