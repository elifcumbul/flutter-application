import 'package:flutter/material.dart';
import 'package:take_me_out/tabs/components/search_comp/search_body.dart';

class SearchPageTab extends StatefulWidget {
  const SearchPageTab({super.key});

  @override
  State<SearchPageTab> createState() => _SearchPageTabState();
}

class _SearchPageTabState extends State<SearchPageTab> {
  @override
  Widget build(BuildContext context) {
    return const SearchBody();
  }
}