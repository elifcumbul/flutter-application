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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      decoration: const BoxDecoration(
      ),
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
                vertical: 20.0,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: index == selectedIndex ? const Color(0xff805600) : const Color.fromARGB(255, 14, 17, 43),
                    fontSize: 25.0,
                    letterSpacing: 1.5,
                    
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}