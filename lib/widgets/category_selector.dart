import 'package:flutter/material.dart';
//import 'package:take_me_out/utils/project_utils.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  //color: index == selectedIndex ? Color.fromARGB(208, 101, 74, 141) : Color.fromARGB(208, 157, 124, 207),
                  fontSize: 25.0,
                  letterSpacing: 1.5,
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}