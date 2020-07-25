import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:projectmanager/Widgets/EntryItems.dart';

import 'User.dart';
// import 'package:projectmanager/project/User.dart';

class ProjectsList extends StatefulWidget {
  static const routeName3 = '/project-list';

  static const menuItems1 = <String>[
    "Second Year",
    "Third Year",
    "Fourth Year",
  ];

  @override
  _ProjectsListState createState() => _ProjectsListState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('menuItems1', menuItems1));
  }
}

class _ProjectsListState extends State<ProjectsList> {
  String _btnSelectedVal;
  String _btnSelectedVal1;

  List<User> _user = [];

  String value="";

  bool disablebutton = true;
  bool disableSecondDropdown = true;

  List<DropdownMenuItem<String>> _dropDownList = ProjectsList.menuItems1
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
List<DropdownMenuItem<String>> _dropDownList1 = List();

  final se ={
    "1":"Sem 3",
    "2":"Sem 4",
  };

  final te ={
    "1":"Sem 5",
    "2":"Sem 6",
  };

  final be ={
    "1":"Sem 7",
  };

  void popse(){
    for(String key in se.keys){
      _dropDownList1.add(DropdownMenuItem<String>(
        child: Text(se[key]),
        value: se[key],
        ));
    }
  }

  void popte(){
      for(String key in te.keys){
        _dropDownList1.add(DropdownMenuItem<String>(
          child: Text(te[key]),
          value: te[key],
          ));
      }
    }

  void popbe(){
    for(String key in be.keys){
      _dropDownList1.add(DropdownMenuItem<String>(
        child: Text(be[key]),
        value: be[key],
        ));
    }
  }
  void selcted(_value){

    if(_value =="Second Year"){
      _dropDownList1 =[];
      popse();
    }else if(_value =="Third Year"){
      _dropDownList1 =[];
      popte();
    }else if(_value =="Fourth Year"){
      _dropDownList1 =[];
      popbe();
    }

    setState(() {
      _btnSelectedVal =_value;
      disablebutton=false;
    });
  }

  void secondselected(_value){
    setState(() {
      _btnSelectedVal1=_value;
    });
  }

  final fb = FirebaseDatabase.instance;

  get menuItems1 => null;

  double screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    // final dbRef = FirebaseDatabase.instance.reference().child("Project");

    // final show = dbRef.setPriority(semester).then((value) => null);

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 35, 15, 15),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(125),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),

            // const SizedBox(height: 40),
            Container(
              child: ListView(
                itemExtent: 65,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        screenWidth / 10, 45, screenWidth / 10, 0),
                    child: Text(
                      "Previous Year",
                      style: TextStyle(
                        // color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                  ),
                  ListTile(
                      title: Text("Choose the Year :-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: Container(
                        color: Colors.transparent,
                        child: DropdownButton(

                          value: _btnSelectedVal,
                          hint: Text("Choose",
                            style: TextStyle(
                              color: Colors.black87,
                            ),),

                          onChanged: (_value)=>selcted(_value) ,
                          items:_dropDownList,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Choose the Sem :-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: Container(
                        color: Colors.transparent,
                        child: DropdownButton(

                          value: _btnSelectedVal1,
                          hint: Text("Choose",
                            style: TextStyle(
                              color: Colors.black87,
                            ),),

                          onChanged: disablebutton ?null : (_value)=> secondselected(_value),
                          items:_dropDownList1,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, screenHeight / 4, 10, 0),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withAlpha(120),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ui(context),
            )
          ],
        ),
      ),
    );
  }

  Widget ui(BuildContext context) {
    return ListView.builder(
      itemCount: _user.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Card(
          margin: EdgeInsets.fromLTRB(screenWidth / 44, 7, screenWidth / 52, 3),
          child: Container(
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          _user[index].aYear,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(_user[index].pname,
                            style: Theme.of(context).textTheme.headline1),
                        Text(_user[index].sem,
                            style: Theme.of(context).textTheme.headline2),
                        Text(_user[index].year,
                            style: Theme.of(context).textTheme.headline1),
                      ],
                    ),
                    new SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("1." + _user[index].name1,
                                style: Theme.of(context).textTheme.headline3),
                            Text("2." + _user[index].name2,
                                style: Theme.of(context).textTheme.headline3),
                            Text("3." + _user[index].name3,
                                style: Theme.of(context).textTheme.headline3),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
