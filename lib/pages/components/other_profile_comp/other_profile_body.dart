import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_container/tab_container.dart';
import 'package:take_me_out/contollers/friends_by_username_controller.dart';
import 'package:take_me_out/models/friends_by_username_model.dart';
import 'package:take_me_out/pages/components/other_profile_comp/other_profile_background.dart';


class OtherProfileBody extends StatefulWidget {
  final String profileKey;
  const OtherProfileBody({required this.profileKey});

  @override
  State<OtherProfileBody> createState() => _OtherProfileBodyState();
}

class _OtherProfileBodyState extends State<OtherProfileBody> {
  
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    late String profileK = widget.profileKey;
    FriendsByUsernameController friendsByUsernameController = Get.put(FriendsByUsernameController(profileKey: profileK));


    Size size = MediaQuery.of(context).size;
    return OtherProfileBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
            padding: const EdgeInsets.only(top: 70.0, left: 20.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      size: 30.0, color: Colors.grey),
                ),
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
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, left: 120.0, right: 120.0),
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
                      const CircleAvatar(
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
                        friendsByUsernameController.friendsByUsernameModel?.users?.name ?? "name",
                        style: const TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        friendsByUsernameController.friendsByUsernameModel?.users?.surname ?? "surname",
                        style: const TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    friendsByUsernameController.friendsByUsernameModel?.users?.userName ?? "username",
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0.0, left: 0.0),
                      //height: 80.0,
                      child: const Text(
                        'friends',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 5.0, right: 125.0),
                    //   height: 80.0,
                    //   child: const Text(
                    //     '6 following',
                    //     style: TextStyle(
                    //       fontSize: 15.0,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                 const SizedBox(height: 40.0),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 250.0),
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Created Events",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
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
                    child: ListView.builder(
                      itemCount: friendsByUsernameController.friendsByUsernameModel?.users?.events?.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Card(
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
                                                        friendsByUsernameController.friendsByUsernameModel?.users?.events?[index].name ?? "no name",
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
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  children: [
                                                    Text("'"),
                                                    Text(
                                                      friendsByUsernameController.friendsByUsernameModel?.users?.events?[index].description ?? "no description",
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
                                                      friendsByUsernameController.friendsByUsernameModel?.users?.events?[index].eventDate ?? "no event date",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    const Text("Start Time: "),
                                                    Text(
                                                      friendsByUsernameController.friendsByUsernameModel?.users?.events?[index].eventTime ?? "noEventTime",
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
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
