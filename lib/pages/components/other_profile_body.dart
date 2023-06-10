import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_container/tab_container.dart';
import 'package:take_me_out/contollers/friends_controller.dart';
import 'package:take_me_out/tabs/components/profile_comp/profile_background.dart';

import '../../contollers/user_controller.dart';

class OtherProfileBody extends StatefulWidget {
  const OtherProfileBody({super.key});

  @override
  State<OtherProfileBody> createState() => _OtherProfileBodyState();
}

class _OtherProfileBodyState extends State<OtherProfileBody> {
  FriendsController friendsController = Get.put(FriendsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ProfileBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 90.0, left: 120.0, right: 120.0),
                  height: size.height * 0.20,
                  width: size.width * 0.9,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff0E112B),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(300)),
                    color: Color(0xffE4AE58),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/woman.png'),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        friendsController.userModel?.users?.name ?? 'no name',
                        style: const TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        friendsController.userModel?.users?.surname ??
                            'no surname',
                        style: const TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    friendsController.userModel?.users?.userName ?? 'no username',
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6.0, left: 125.0),
                      height: 80.0,
                      child: const Text(
                        '6 followers',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0, right: 125.0),
                      height: 80.0,
                      child: const Text(
                        '6 following',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 250.0),
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      // gradient: const LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [

                      //     Color(0xff92c584),
                      //     Colors.white,
                      //   ],
                      // ),
                      //color: const Color(0xffbfe9ff),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Created Events",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffbfe9ff),
                          Color(0xff95d785),
                        ],
                      ),
                      color: const Color(0xffbfe9ff),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: friendsController
                            .userModel!.users!.events?.length, //kEvents.length
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 8,
                                  shadowColor: Color(0xffbfe9ff),
                                  margin: const EdgeInsets.only(
                                      right: 10.0, left: 10.0, bottom: 15.0),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    height: 110.0,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    friendsController
                                                            .userModel!
                                                            .users!
                                                            .events?[index]
                                                            .name ??
                                                        "no name",
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(flex: 1),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // Expanded(
                                            //   flex: 1,
                                            //   child: Row(
                                            //     children: [
                                            //       Text(
                                            //         // user.userModel!.users!.events?[index].categoryId ??
                                            //         "no category",
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  Text("'"),
                                                  Text(
                                                    friendsController
                                                            .userModel!
                                                            .users!
                                                            .events?[index]
                                                            .description ??
                                                        "no description",
                                                  ),
                                                  Text("'"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  const Text("Date: "),
                                                  Text(
                                                    friendsController
                                                            .userModel!
                                                            .users!
                                                            .events?[index]
                                                            .eventDate ??
                                                        "no event date",
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  const Text("Start Time: "),
                                                  Text(
                                                    friendsController
                                                            .userModel!
                                                            .users!
                                                            .events?[index]
                                                            .eventTime ??
                                                        "noEventTime",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
