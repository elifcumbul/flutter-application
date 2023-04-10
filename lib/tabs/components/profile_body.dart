import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';
import 'package:take_me_out/tabs/components/profile_background.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ProfileBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 90.0, left: 120.0, right: 120.0),
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
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/images/woman.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
            child: const ProfileInfoWidget(
              username: '/elfcmbl',
              name: 'Elif Cumbul',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 80.0,
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
            child: const Text(
              '6 friends',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: AspectRatio(
              aspectRatio: 10 / 9,
              child: TabContainer(
                childPadding: EdgeInsets.only(bottom: 10.0),
                radius: 30,
                tabEdge: TabEdge.top,
                tabCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  animation =
                      CurvedAnimation(curve: Curves.easeIn, parent: animation);
                  return SlideTransition(
                    position: Tween(
                      begin: const Offset(0.2, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                colors: const <Color>[
                  Color(0xffbfe9ff),
                  Color(0xff92c584),
                ],
                children: _getChildren1(),
                tabs: _getTabs1(),
              ),
            ),
          ),
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
          style: const TextStyle(fontSize: 35),
          textAlign: TextAlign.center,
        ),
        Text(
          username,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

List<Widget> _getChildren1() {
  List<EventData> events = kEvents
      .map(
        (e) => EventData.fromJson(e),
      )
      .toList();

  return events.map((e) => Event(data: e)).toList();
}

List<String> _getTabs1() {
  return <String>['Created', 'Saved'];
}

class Event extends StatelessWidget {
  final Color? color;
  final EventData data;

  const Event({
    Key? key,
    this.color,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6, //kEvents.length
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 10.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        height: 110.0,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      // ImageIcon(
                                      //   AssetImage('assets/icons/vinyl.png'),
                                      //   size: 40.0,
                                      // ),
                                      Text(
                                        data.name,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(flex: 1),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_pin),
                                      Text(
                                        data.location,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Text(
                                        data.category,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Text(
                                        data.description,
                                      ),
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
                                  Text("Created At: "),
                                  Text(
                                    data.createdDate,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Due Date: "
                                  ),
                                  Text(
                                    data.eventDate,
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
      ],
    );
  }
}

class EventData {
  int index;
  bool locked;
  final String category;
  final String name;
  final String description;
  final String eventDate;
  final String location;
  final String createdDate;

  EventData({
    this.index = 0,
    this.locked = false,
    required this.category,
    required this.name,
    required this.description,
    required this.eventDate,
    required this.location,
    required this.createdDate,
  });

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
        index: json['index'],
        category: json['category'],
        name: json['name'],
        description: json['description'],
        eventDate: json['eventDate'],
        location: json['location'],
        createdDate: json['createdDate'],
      );
}

const List<Map<String, dynamic>> kEvents = [
  {
    'index': 0,
    'category': 'Music',
    'name': 'Concert Day',
    'description': 'live fast die young',
    'eventDate': '19/03/2023',
    'location': 'İzmir',
    'createdDate': '06/03/2023',
  },
  {
    'index': 1,
    'category': 'Sport',
    'name': 'Tracking',
    'description': 'lets track!',
    'eventDate': '20/06/2023',
    'location': 'Muğla',
    'createdDate': '07/03/2023',
  },
];
