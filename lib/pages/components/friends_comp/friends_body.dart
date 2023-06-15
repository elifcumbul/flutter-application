import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_me_out/contollers/all_users_controller.dart';
import 'package:take_me_out/pages/components/friends_comp/friends_background.dart';

class FriendsBody extends StatefulWidget {
  const FriendsBody({super.key});

  @override
  State<FriendsBody> createState() => _FriendsBody();
}

class _FriendsBody extends State<FriendsBody> {
  final profileController = TextEditingController();
  AllUsersController allUsersController = Get.put(AllUsersController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FriendsBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 40.0),
          Container(
            margin: const EdgeInsets.only(left: 40.0),
            child: const Text(
              "Friends",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            width: double.maxFinite,
            child: Container(
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
                        return InkWell(
                          onTap: () {
                            //Get.to(const OtherProfilePage());
                          },
                          child: Container(
                            width: size.width,
                            //color: Color.fromARGB(235, 236, 237, 228),
                            margin: const EdgeInsets.only(bottom: 20.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                      margin: const EdgeInsets.only(left: 40.0),
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
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
