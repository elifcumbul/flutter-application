import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:take_me_out/tabs/components/home_comp/home_background.dart';

class HomePageTab extends StatefulWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Timeline(),
      ),
    );
  }
}

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  DateTime _selectedDate = DateTime.now();
  List _users = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    setState(() {
      _users = data["users"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Take Me Out', style: TextStyle(fontSize: 30)),
      // ),
      body: HomeBackground(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color(0xff92c584),
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                onDateChange: (selectedDate) {
                  _selectedDate = selectedDate;
                },
              ),
            ),
          ],
      
      
      
          // mainAxisAlignment: MainAxisAlignment.start,
          // children: [
          //   Container(
          //     //margin: const EdgeInsets.only(left: 40),
          //     padding: const EdgeInsets.all(30),
          //     height: size.height * 0.4,
          //     decoration: const BoxDecoration(
          //         boxShadow: [
          //           BoxShadow(
          //             color: Color.fromARGB(154, 68, 44, 0),
          //             spreadRadius: 5,
          //             blurRadius: 7,
          //             offset: Offset(0, 3),
          //           ),
          //         ],
          //         borderRadius:
          //             BorderRadius.only(bottomLeft: Radius.circular(100)),
          //         color: Color.fromARGB(255, 14, 17, 43)),
          //   ),
          //   Expanded(
          //     child: ListView.builder(
          //       itemCount: _users.length,
          //       itemBuilder: (context, index) {
          //         return Row(
          //           children: [
          //             Container(
          //               margin: const EdgeInsets.only(
          //                   left: 10.0, right: 5.0, bottom: 20.0),
          //               padding: const EdgeInsets.all(7.0),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: const <Widget>[
          //                   // Padding(
          //                   //   padding: const EdgeInsets.all(5.0),
          //                   //   child: Container(
          //                   //     height: size.height * 0.08,
          //                   //     child: CircleAvatar(
          //                   //       backgroundColor: Color.fromARGB(255, 14, 17, 43),
          //                   //       radius: 30.0,
          //                   //       child: CircleAvatar(
          //                   //         backgroundImage:
          //                   //           NetworkImage(_users[index]["urlAvatar"]),
          //                   //           radius: 29.0,
          //                   //       ),
                                  
          //                   //     ),
          //                   //   ),
          //                   // ),
          //                   // Padding(
          //                   //   padding: const EdgeInsets.all(0.0),
          //                   //   child: Text(
          //                   //     _users[index]["username"],
          //                   //     style: const TextStyle(
          //                   //       fontSize: 12,
          //                   //     ),
          //                   //   ),
          //                   // ),
          //                 ],
          //               ),
          //             ),
          //             Expanded(
          //               child: Container(
          //                 padding: const EdgeInsets.all(60),
          //                 decoration: const BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Color.fromARGB(154, 68, 44, 0),
          //                         spreadRadius: 2,
          //                         blurRadius: 2,
          //                         offset: Offset(0, 3),
          //                       ),
          //                     ],
          //                     borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(30),
          //                         bottomLeft: Radius.circular(30)),
          //                     color: Color.fromARGB(255, 255, 221, 175)),
          //                 margin: const EdgeInsets.only(left: 20.0, bottom: 20.0),
          //               ),
          //             ),
          //           ],
          //         );
          //       },
          //     ),
          //   ),
          // ],
        ),
      ),
    );
  }
}

//Card timeline part





//renkli kısım

// Container(
//             margin: const EdgeInsets.only(top: 40, left: 10),
//             padding: const EdgeInsets.all(30),
//             height: size.height * 0.08,
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(137, 189, 194, 255),
//                   spreadRadius: 2,
//                   blurRadius: 2,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(100),
//                 bottomLeft: Radius.circular(100)
//               ),
//               color: Color.fromARGB(255, 63, 74, 165)
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 35, right: 10),
//             padding: const EdgeInsets.all(30),
//             height: size.height * 0.08,
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(137, 20, 82, 16),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset.zero,
//                 ),
//               ],
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(100),
//                 bottomRight: Radius.circular(100)
//               ),
//               color: Color.fromARGB(255, 149, 215, 133)
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 35, left: 10),
//             padding: const EdgeInsets.all(30),
//             height: size.height * 0.08,
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(137, 63, 73, 165),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(100),
//                 bottomLeft: Radius.circular(100)
//               ),
//               color: Color.fromARGB(255, 189, 194, 255)
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 35, right: 10),
//             padding: const EdgeInsets.all(30),
//             height: size.height * 0.08,
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(137, 0, 31, 42),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(100),
//                 bottomRight: Radius.circular(100)
//               ),
//               color: Color.fromARGB(255, 191, 233, 255)
//             ),
//           ),