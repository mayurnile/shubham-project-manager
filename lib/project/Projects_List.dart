import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'User.dart';

import '../models/project.dart';

class ProjectList extends StatefulWidget {
  static const menuItems = <String>[
    "Second Year",
    "Third Year",
    "Fourth Year",
  ];

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  String value = "";

  final _formKey = GlobalKey<FormState>();

  List<User> _user = [];

  bool disablebutton = true;
  bool disableSecondDropdown = true;

  final TextEditingController semester = new TextEditingController();
  final TextEditingController groupmem1 = new TextEditingController();
  final TextEditingController groupmem2 = new TextEditingController();
  final TextEditingController groupmem3 = new TextEditingController();
  final TextEditingController projtopic = new TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference().child("Project");

  Function addP;

  double screenHeight, screenWidth;

  String _btnSelectedVal;
  String _btnSelectedVal1;

  List<Project> _fetchedProjects = [];

  List<DropdownMenuItem<String>> _dropDownList = ProjectList.menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  List<DropdownMenuItem<String>> _dropDownList1 = List();

  final se = {
    "1": "Sem 3",
    "2": "Sem 4",
  };

  final te = {
    "1": "Sem 5",
    "2": "Sem 6",
  };

  final be = {
    "1": "Sem 7",
  };

  void popse() {
    for (String key in se.keys) {
      _dropDownList1.add(DropdownMenuItem<String>(
        child: Text(se[key]),
        value: se[key],
      ));
    }
  }

  void popte() {
    for (String key in te.keys) {
      _dropDownList1.add(DropdownMenuItem<String>(
        child: Text(te[key]),
        value: te[key],
      ));
    }
  }

  void popbe() {
    for (String key in be.keys) {
      _dropDownList1.add(DropdownMenuItem<String>(
        child: Text(be[key]),
        value: be[key],
      ));
    }
  }

  void selcted(_value) {
    if (_value == "Second Year") {
      _dropDownList1 = [];
      popse();
    } else if (_value == "Third Year") {
      _dropDownList1 = [];
      popte();
    } else if (_value == "Fourth Year") {
      _dropDownList1 = [];
      popbe();
    }

    setState(() {
      _btnSelectedVal = _value;
      disablebutton = false;
    });
  }

  void secondselected(_value) async {
    _btnSelectedVal1 = _value;

    //fetching data from database
    final projectData =
        await dbRef.child(_btnSelectedVal).child(_btnSelectedVal1).once();

    //storing the value into map
    //map is used because firebase sends the data such way
    Map<dynamic, dynamic> projects = projectData.value;

    //creating list of fetched proejcts
    projects.forEach((projectId, projectData) {
      final Project newProject = Project.fromJSON(projectData);
      _fetchedProjects.add(newProject);
    });

    _fetchedProjects.forEach((project) {
      print(project.projectTopic);
    });

    setState(() {});
  }

  // bool _validate1=false, _validate2 =false,_validate3=false,_validate4 =false;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 55, 15, 25),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(125),
                  ),
                ),
              ),
            ),
            Container(
              child: ListView(
                itemExtent: 65,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        screenWidth / 10, 10, screenWidth / 10, 0),
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
                    title: Text(
                      "Choose the Year :-",
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
                        hint: Text(
                          "Choose",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        onChanged: (_value) => selcted(_value),
                        items: _dropDownList,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Choose the Sem :-",
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
                        hint: Text(
                          "Choose",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        onChanged: disablebutton
                            ? null
                            : (_value) => secondselected(_value),
                        items: _dropDownList1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, screenHeight / 3.6, 10, 0),
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
