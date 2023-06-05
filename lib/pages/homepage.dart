import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../tabs/chat_page_tab.dart';
//import '../tabs/event_editing_page_tab.dart';
import '../tabs/event_editing_page_tab.dart';
import '../tabs/home_page_tab.dart';
import '../tabs/search_page_tab.dart';
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
    //final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar( //notch floating butonun etrafıonda boşluk oluturur, shape: CircularNotheRectengular()
          child: TabBar(
            indicatorWeight: 0.100,
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home_rounded)), //groups_rounded
              Tab(
                  icon: Icon(Icons
                      .search_rounded)), //location_pin, map_rounded, event_rounded
              Tab(icon: Icon(Icons.edit_calendar_rounded)),
              //Tab(icon: Icon(Icons.email_rounded)),
              Tab(icon: Icon(Icons.account_circle))
            ],
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children:[
            HomePageTab(),
            SearchPageTab(),
            EventEditingPage(),
            //ChatPageTab(),
            ProfilePageTab(),
          ],
        ),
      ),
    );
  }
}
