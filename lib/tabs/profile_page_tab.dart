import 'package:flutter/material.dart';

class ProfilePageTab extends StatefulWidget {
  const ProfilePageTab({super.key});

  @override
  State<ProfilePageTab> createState() => _ProfilePageTabState();
}

class _ProfilePageTabState extends State<ProfilePageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: Card(
                          shadowColor: const Color(0xFF586400),
                          elevation: 8,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Stack(
                            children: [
                              Image.network(
                                'https://i.pinimg.com/564x/bd/9e/c3/bd9ec30497867b0bc1c7bc5cf81d0aa2.jpg',
                                height: 240,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 80.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 50.0),
                        child: const ProfileInfoWidget(
                          username: '/elfcmbl',
                          name: 'Elif',
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ],
          ), //profile pic //Name-username
        ],
      ),
    );
  }
}

class ProfileInfoWidget extends StatelessWidget {
  final String name;
  final String username;

  const ProfileInfoWidget({
    Key? key,
    required this.name,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
             fontSize: 30),
          textAlign: TextAlign.center,
        ),
        Text(
          username,
          style: const TextStyle(
            fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
