import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RecentChats extends StatefulWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  List _chats = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    setState(() {
      _chats = data["chats"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          //color: Color.fromARGB(21, 143, 145, 147), //chage it later
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: _chats.length,
            itemBuilder: (context, index) {
              //final Message chat = _chats[index];
              return Container(
                margin: const EdgeInsets.only(top:8.0, bottom: 8.0, right: 20.0, left: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  //color: Color.fromARGB(153, 255, 255, 255),  //change this color
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                            _chats[index]["urlAvatar"],
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _chats[index]["sender"],
                              style: const TextStyle(
                                //color: Color.fromARGB(255, 60, 38, 120),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                _chats[index]["text"],
                                style: const TextStyle(
                                  //color: Color.fromARGB(255, 37, 27, 64),
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, //mesajların kaybolmasını sağlıyor(sonunun)
                              ),
                            ),
                          ],
                        ), //chat.sender.name
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          _chats[index]["time"],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 1, 1, 1),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
