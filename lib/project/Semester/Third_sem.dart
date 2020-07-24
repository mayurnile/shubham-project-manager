// import 'package:flutter/material.dart';
// import 'package:projectmanager/project/User.dart';

// class TEProjects extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     final ScreenHeight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;

//     final List<User> user = [
//       User(Year: 'Third Year', Sem: "6",Pname: "GaminG HUB", Name1: "SHUBHAM B. MEMANE", Name2: "PRIYA A. THAKARE", Name3: "VIBHA R. VISHE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//       User(Year: 'Third Year', Sem: "5",Pname: "FooD Order", Name1: "DURVA JOSHI", Name2: "GEETA Y. SURYWANSHI", Name3: "PRIYANKA PAWALE"),
//     ];

//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Container(
//               color: Colors.black87,
//               child: Container(
//                 margin:EdgeInsets.fromLTRB(20,45, 15 , 15),
//                 decoration: BoxDecoration(
//                   color: Colors.indigo,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(125),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),


//             ListView(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.fromLTRB(ScreenWidth/10, 15, ScreenWidth/10 ,0),
//                   child: Text("Previous Year",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 45,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Column(
//                     children: user.map((us){
//                       return Card(
//                         elevation: 10,
//                         margin: EdgeInsets.fromLTRB(ScreenWidth/26 ,10,ScreenWidth/26,5),
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Row(
//                             children: <Widget>[
//                               Column(
//                                 children: <Widget>[
//                                   Text(us.Year,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                     ),),
//                                   Text("SEM :-"+us.Sem.toString(),
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                     ),),
//                                 ],
//                               ),
//                               SizedBox(width: 40),
//                               Column(
//                                 children: <Widget>[
//                                   Text(us.Pname,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                   SizedBox(height: 15),
//                                   Row(
//                                     children: <Widget>[
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           Text("1."+us.Name1,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w900,
//                                               fontSize: 18 ,
//                                             ),),
//                                           Text("2."+us.Name2,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18,
//                                             ),),
//                                           Text("3."+us.Name3,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18,
//                                             ),),
//                                           Text(""),
//                                         ],
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               )

//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
