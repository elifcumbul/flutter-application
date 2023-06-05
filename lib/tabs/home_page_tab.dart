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
        ),
      ),
    );
  }
}

