
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ProjectSubmission extends StatefulWidget {

  static const menuItems= <String>[
    "Second Year",
    "Third Year",
    "Fourth Year",
  ];

  @override
  _ProjectSubmissionState createState() => _ProjectSubmissionState();
}

class _ProjectSubmissionState extends State<ProjectSubmission> {

  String value="";

  final _formKey = GlobalKey<FormState>();

  bool disablebutton = true;
  bool disableSecondDropdown = true;

  final TextEditingController semester = new TextEditingController();
  final TextEditingController groupmem1 = new TextEditingController();
  final TextEditingController groupmem2 = new TextEditingController();
  final TextEditingController groupmem3 = new TextEditingController();
  final TextEditingController projtopic = new TextEditingController();

  
  final dbRef = FirebaseDatabase.instance.reference().child("Project");
    
  Function addP;

  String _btnSelectedVal;
  String _btnSelectedVal1;

  List<DropdownMenuItem<String>> _dropDownList = ProjectSubmission.menuItems
      .map((String value)=>DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  ),).toList();

  // List<DropdownMenuItem<String>> _dropDownList1 = ProjectSubmission.menuItems1
  //     .map((String value)=>DropdownMenuItem<String>(
  //   value: value,
  //   child: Text(value),
  // ),).toList();

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


  bool _validate1=false, _validate2 =false,_validate3=false,_validate4 =false;

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
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

            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 12),
                    Text("Idea Submission",
                      style: TextStyle(
                        //color: Colors.black87,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
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

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.all(30),
                            margin: EdgeInsets.fromLTRB(30, 15, 30,15),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller : groupmem1,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person , size: 32,color: Colors.black,),
                                labelText: "Group Member 1",
                                errorText: _validate1 ? "fill the values" : null,
                                errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                            ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 5, 30,15),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: groupmem2,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person , size: 32,color: Colors.black,),
                                labelText: "Group Member 2",
                                errorText: _validate2? "fill the values" : null,
                                labelStyle:Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
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
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: groupmem3,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person ,size: 32,color: Colors.black,),
                                labelText: "Group Member 3",
                                errorText: _validate3 ? "fill the values" : null,
                                errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 45, 30,0),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: projtopic,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.book ,size: 40 ,color: Colors.black,),
                                labelText: "Project Name",
                                errorText: _validate4 ?"fill the values" : null,
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
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
                                color: Colors.transparent,
                                child: Text("Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                    onPressed: () {
                                        if (_formKey.currentState.validate()) {

                                          if(DateTime.now().month <DateTime.april){
                                            dbRef.push().set({
                                            "Acadmic year" : _btnSelectedVal,
                                            "Year": DateTime.now().subtract(Duration(days: 365)).toString()+"-"+DateTime.now().year.toString(),
                                            "Sem": _btnSelectedVal1,
                                            "Member1": groupmem1.text,
                                            "Member2": groupmem2.text,
                                            "Member3": groupmem3.text,
                                            "projtopic": projtopic.text,
                                          }).then((_) {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(content: Text('Successfully Added')));
                                            semester.clear();
                                            groupmem1.clear();
                                            groupmem2.clear();
                                            groupmem3.clear();
                                            projtopic.clear();
                                          }).catchError((onError) {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(content: Text(onError)));
                                          });
                                          }else if(DateTime.july >=DateTime.now().month){
                                            dbRef.child(_btnSelectedVal).child(_btnSelectedVal1).push().set({
                                            "Acadmic year" : _btnSelectedVal,
                                            "Year":DateTime.now().year.toString() + "-" +DateTime.now().year.toString(),
                                            "Sem": _btnSelectedVal1,
                                            "Member1": groupmem1.text,
                                            "Member2": groupmem2.text,
                                            "Member3": groupmem3.text,
                                            "projtopic": projtopic.text,
                                              

                                          }).then((_) {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(content: Text('Successfully Added')));
                                            semester.clear();
                                            groupmem1.clear();
                                            groupmem2.clear();
                                            groupmem3.clear();
                                            projtopic.clear();
                                          }).catchError((onError) {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(content: Text(onError)));
                                          });
                                          }


                                          // dbRef.push().set({
                                          //   "Year":DateTime.now().year,
                                          //   "Sem": semester.text,
                                          //   "Member1": groupmem1.text,
                                          //   "Member2": groupmem2.text,
                                          //   "Member3": groupmem3.text,
                                          //   "projtopic": projtopic.text,
                                          // }).then((_) {
                                          //   Scaffold.of(context).showSnackBar(
                                          //       SnackBar(content: Text('Successfully Added')));
                                          //   semester.clear();
                                          //   groupmem1.clear();
                                          //   groupmem2.clear();
                                          //   groupmem3.clear();
                                          //   projtopic.clear();
                                          // }).catchError((onError) {
                                          //   Scaffold.of(context)
                                          //       .showSnackBar(SnackBar(content: Text(onError)));
                                          // });
                                        }
                                      },
                              ),
                            ),
                          ),
                          BackButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
        ] ,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    semester.dispose();
    groupmem1.dispose();
    groupmem2.dispose();
    groupmem3.dispose();
    projtopic.dispose();
  }
}
