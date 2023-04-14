import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:take_me_out/tabs/components/search_comp/search_background.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> with TickerProviderStateMixin {
  late final TabController _tabController;
  final profileController = TextEditingController();

  List images = [
    "national_park1.png",
    "national_park2.png",
    "national_park3.png"
  ];

  var categories = {
    "painting.png": "Art",
    "sports.png": "Sport",
    "theatre.png": "Stage",
    "vinyl.png": "Music",
  };

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
            // Row(
            //   children: [
            //     Expanded(
            //         child: Container(
            //       height: 100,
            //     )),
            //   ],
            // ),
            Container(
              padding: const EdgeInsets.only(top: 70.0, left: 20.0),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30.0, color: Colors.grey),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
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
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  //isScrollable: true,
                  //labelPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  tabs: [
                    Tab(text: "Events"),
                    Tab(text: "Friends"),
                  ],
                ),
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
                            itemCount: images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 10.0),
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/img/" + images[index]),
                                      fit: BoxFit.cover),
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
                              "Explore More",
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
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
                            itemCount: categories.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 27.0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 7.0, left: 7.0),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/categories/" +
                                                  categories.keys
                                                      .elementAt(index)),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        categories.values.elementAt(index),
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //     itemCount: images.length,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (_, index) {
                  //       return Container(
                  //         margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                  //         height: 300,
                  //         width: 200,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           image: DecorationImage(
                  //             image: AssetImage("assets/img/" + images[index]),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       );
                  //     })
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    height: size.height * 0.6,
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
                              onPressed: () => profileController.clear(),
                            ),
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(10),
                            //     borderSide: const BorderSide(
                            //       color: Color(0xffE4AE58),
                            //     ),
                            // ),
                            border: const UnderlineInputBorder(),
                            labelText: "Search",
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 2.0,
                              color: Color(0xff0E112B),
                            ),
                            
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
