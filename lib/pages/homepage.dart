import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../tabs/chat_page_tab.dart';
//import '../tabs/event_editing_page_tab.dart';
import '../tabs/event_editing_page_tab.dart';
import '../tabs/home_page_tab.dart';
import '../tabs/map_page_tab.dart';
import '../tabs/profile_page_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: false, //butonun arkasının saydam olması
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: showFab
            ? FloatingActionButton(
                child: const Icon(
                  Icons.edit_calendar_rounded,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EventEditingPage(),
                    ));
                },
              )
            : null,
        bottomNavigationBar: BottomAppBar( //notch floating butonun etrafıonda boşluk oluturur, shape: CircularNotheRectengular()
          child: TabBar(
            indicatorWeight: 0.5,
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home_rounded)), //groups_rounded
              Tab(
                  icon: Icon(Icons
                      .location_pin)), //location_pin, map_rounded, event_rounded
              Tab(icon: Icon(Icons.email_rounded)),
              Tab(icon: Icon(Icons.account_circle))
            ],
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children: const [
            HomePageTab(),
            MapPageTab(),
            ChatPageTab(),
            ProfilePageTab(),
          ],
        ),
      ),
    );
  }
}
