import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:take_me_out/contollers/ai_controller.dart';
import 'package:take_me_out/contollers/all_users_controller.dart';
import 'package:take_me_out/contollers/friends_controller.dart';
import 'package:take_me_out/contollers/serp_api_controller.dart';
import 'package:take_me_out/tabs/components/search_comp/search_background.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> with TickerProviderStateMixin {
  late final TabController _tabController;
  final profileController = TextEditingController();
  //AllUsersModel? allUsersModel;
  AllUsersController allUsersController = Get.put(AllUsersController());
  FriendsController friendsController = Get.put(FriendsController());
  AiController aiController = Get.put(AiController());
  SerpApiController serpApiController = Get.put(SerpApiController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SearchBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70.0, left: 20.0),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 30.0, color: Colors.grey),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                "Discover",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                //isScrollable: true,
                //labelPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                tabs: const [
                  Tab(text: "Events"),
                  Tab(text: "Friends"),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              width: double.maxFinite,
              height: size.height * 0.48,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: ListView.builder(
                            itemCount: serpApiController
                                .serpModel!.eventsResults?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              Color itemColor = getItemColor(index);
                              return Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 10.0),
                                height: 300,
                                width: 200,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: itemColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Container(
                                      //   margin: const EdgeInsets.only(
                                      //       left: 10.0, top: 10.0),
                                      //   height: 100.0,
                                      //   width: 100.0,
                                      //   child: Image.asset(
                                      //       'assets/images/woman.png'),
                                      // ),
                                      // const SizedBox(
                                      //   height: 20,
                                      // ),
                                      Text(
                                        //Profil Photo
                                        //username
                                        ///aiController.aiModel!.recommendedUsers?[index].recommendedActivity ?? "rec", //Matched Activity
                                        serpApiController.serpModel!
                                                .eventsResults?[index].title ??
                                            "username",
                                        //"username",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        serpApiController
                                                .serpModel!
                                                .eventsResults?[index]
                                                .address?[0] ??
                                            "username",
                                      ),
                                      Text(
                                        serpApiController
                                                .serpModel!
                                                .eventsResults?[index]
                                                .date
                                                ?.startDate ??
                                            "",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Suggestions",
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(left: 20.0),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                aiController.aiModel!.recommendedUsers?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200.0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color.fromARGB(59, 193, 187, 239),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left:5.0, top: 5.0),
                                          height: 50.0,
                                          width: 50.0,
                                          child: Image.asset(
                                              'assets/images/woman.png'),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left:10.0, top: 5.0),
                                          child: Text(
                                            aiController
                                                    .aiModel!
                                                    .recommendedUsers?[index]
                                                    .user ??
                                                "rec", //Matched Activity
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      margin:
                                              const EdgeInsets.only(left:8.0, top: 5.0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Matched Events: ",
                                          ),
                                          Text(
                                            aiController
                                                    .aiModel!
                                                    .recommendedUsers?[index]
                                                    .recommendedActivity ??
                                                "rec",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Container(
                    //color: Colors.amber,
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    height: 500,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 4.0,
                        ),
                        TextField(
                          cursorColor: const Color(0xff0E112B),
                          controller: profileController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.person_search_outlined,
                                color: Color(0xff0E112B),
                              ),
                              onPressed: () {},
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffE4AE58),
                              ),
                            ),
                            border: const UnderlineInputBorder(),
                            labelText: "Search",
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 2.0,
                              color: Color(0xff0E112B),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                allUsersController.allUsersModel?.users?.length,
                            itemBuilder: (context, index) {
                              friendsController.userId = allUsersController
                                      .allUsersModel?.users?[index].id ??
                                  "s";
                              return Container(
                                width: size.width,
                                //color: Color.fromARGB(235, 236, 237, 228),
                                margin: const EdgeInsets.only(bottom: 20.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          height: 20.0,
                                          width: 20.0,
                                          child: Image.asset(
                                              'assets/images/woman.png'),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          child: Text(
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                            ),
                                            allUsersController.allUsersModel
                                                    ?.users?[index].name ??
                                                "e",
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 2.0, top: 10.0),
                                          child: Text(
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                            ),
                                            allUsersController.allUsersModel
                                                    ?.users?[index].surname ??
                                                "e",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            allUsersController.allUsersModel
                                                    ?.users?[index].userName ??
                                                "e",
                                          ),
                                        ),
                                        const Text(" - following "),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getItemColor(int index) {
  // List of colors to choose from
  List<Color> colors = [
    Color(0xff95d785),
    Color(0xffbdc2ff),
    Color(0xfffdba4a),
    Color(0xffbfe9ff),
    Colors.orange,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  // Calculate the index of the color based on the list length
  int colorIndex = index % colors.length;

  return colors[colorIndex];
}
