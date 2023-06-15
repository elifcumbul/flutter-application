import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_me_out/contollers/add_photo_controller.dart';
import 'package:take_me_out/contollers/user_controller.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:take_me_out/pages/components/friends_comp/friends_body.dart';
import 'package:take_me_out/pages/friends_page.dart';
import 'package:take_me_out/tabs/components/profile_comp/profile_background.dart';
import 'package:take_me_out/tabs/home_page_tab.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  UserController userController = Get.put(UserController());
  AddPhotoController addPhotoController = Get.put(AddPhotoController());

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => userController.isLoading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ProfileBackground(
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
                      image != null
                          ? ClipOval(
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset('assets/images/woman.png'),
                      Positioned(
                        top: 150.0,
                        left: 130.0,
                        bottom: 20.0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(28)),
                                    height: 100.0,
                                    width: 200,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 20.0,
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Choose Profile Photo",
                                          style: TextStyle(
                                            color: Color(0xff92c584),
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton.icon(
                                              icon: const Icon(
                                                Icons.image,
                                                size: 30.0,
                                              ),
                                              onPressed: (() => pickImage()),
                                              label: const Text("Gallery"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }));
                          },
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xff92c584),
                            size: 45.0,
                          ),
                        ),
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
                        userController.userModel?.users?.name ?? 'no name',
                        style: const TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        userController.userModel?.users?.surname ??
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
                    userController.userModel?.users?.userName ?? 'no username',
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      height: 60.0,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => FriendsBody());
                        },
                        child: const Text(
                          'friends',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
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
                          fontSize: 20.0,
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
                        itemCount: userController
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
                                                    userController
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
                                                    userController
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
                                                    userController
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
                                                    userController
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
          ));
  }
}
