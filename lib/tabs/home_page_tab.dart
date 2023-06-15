import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:take_me_out/contollers/all_users_controller.dart';
import 'package:take_me_out/contollers/events_controller.dart';
import 'package:take_me_out/contollers/user_controller.dart';
import 'package:take_me_out/tabs/components/home_comp/home_background.dart';

import 'package:http/http.dart' as http;
import 'package:take_me_out/models/user_model.dart';

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
  EventsController eventsController = Get.put(EventsController());
  UserController userController = Get.put(UserController());
  DateTime _selectedDate = DateTime.now();

  AllUsersController allUsersController = Get.put(AllUsersController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => eventsController.isLoading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                            Text(
                              DateFormat.yMMMMd().format(DateTime.now()),
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
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: eventsController
                              .eventsModel?.events?.length, //events.length size
                          itemBuilder: (context, index) {
                            Color itemColor = getItemColor(index);
                            if (eventsController
                                    .eventsModel?.events?[index].eventDate ==
                                DateFormat.yMd()
                                    .format(_selectedDate)
                                    .toString()) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                  child: FadeInAnimation(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: const EdgeInsets.only(
                                                  bottom: 12),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                //  width: SizeConfig.screenWidth * 0.78,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: itemColor,
                                                ),
                                                child: Row(children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          //userController.userModel!.users?.userName ?? "name",
                                                          // allUsersController
                                                          //         .allUsersModel!
                                                          //         .users?[index]
                                                          //         .userName ??
                                                          //     "name",
                                                          eventsController.eventsModel?.events?[index].creator?.userName ?? "name",
                                                          style:
                                                              GoogleFonts.lato(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .access_time_rounded,
                                                              color: Colors
                                                                  .grey[200],
                                                              size: 18,
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Text(
                                                              eventsController.eventsModel?.events?[index].eventTime ?? "time",
                                                              //allUsersController.allUsersModel?.users?[index].events?[index].eventTime ?? "",
                                                              style: GoogleFonts
                                                                  .lato(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 30),
                                                            Text(
                                                              eventsController
                                                                      .eventsModel!
                                                                      .events?[
                                                                          index]
                                                                      .eventDate ??
                                                                  "date",
                                                              style: GoogleFonts
                                                                  .lato(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 12),
                                                        Text(
                                                          eventsController.eventsModel?.events?[index].description ?? "description",
                                                          style:
                                                              GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .grey[100]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    height: 60,
                                                    width: 0.5,
                                                    color: Colors.grey[200]!
                                                        .withOpacity(0.7),
                                                  ),
                                                  RotatedBox(
                                                    quarterTurns: 3,
                                                    child: Text(
                                                      eventsController.eventsModel?.events?[index].name ?? "name",
                                                      style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          })),
                ],
              ),
            ),
          ));
  }
}

Color getItemColor(int index) {
  // List of colors to choose from
  List<Color> colors = [
    Color(0xfffdba4a),
    Color(0xffbdc2ff),
    Color(0xffbfe9ff),
    Colors.orange,
    Color(0xff95d785),
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  // Calculate the index of the color based on the list length
  int colorIndex = index % colors.length;

  return colors[colorIndex];
}
