import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_me_out/tabs/components/chat_comp/favorite_contacts.dart';
import 'package:take_me_out/tabs/components/chat_comp/recent_chats.dart';

//import '../utils/project_utils.dart';
import '../pages/homepage.dart';
import 'components/chat_comp/category_selector.dart';

class ChatPageTab extends StatefulWidget {
  const ChatPageTab({Key? key}) : super(key: key);

  @override
  State<ChatPageTab> createState() => _ChatPageTabState();
}

class _ChatPageTabState extends State<ChatPageTab> {
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              /*showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );*/
            },
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            padding: const EdgeInsets.all(25.0),
          ),
        ],
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const CategorySelector(),
          Expanded(
            child: Container(
              height: 500.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  //FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
