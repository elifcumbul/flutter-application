import 'package:flutter/material.dart';
import 'package:take_me_out/tabs/components/search_comp/search_background.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> with TickerProviderStateMixin {
  late final TabController _tabController;

  List images = [
    "national_park1.png",
    "national_park2.png",
    "national_park3.png"
  ];

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
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                )),
              ],
            ),
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
            Container(
              color: Colors.amber,
              margin: const EdgeInsets.only(left: 10.0),
              width: double.maxFinite,
              height: size.height * 0.35,
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
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          height: size.height,
                          width: size.width * 0.35,
                          child: Text(
                            "Explore More",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/img/" + images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
