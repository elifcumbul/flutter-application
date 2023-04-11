import 'package:flutter/material.dart';
import 'package:take_me_out/tabs/components/search_comp/search_background.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> with TickerProviderStateMixin{
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SearchBackground(
      child: Column(
        children: [
          Row(
            children: [
              TabBar(
                tabs: [],
              ),
            ],
          ),

        ],
      ),
    );
  }
}