import 'package:flutter/material.dart';

import 'components/profile_comp/profile_body.dart';


class ProfilePageTab extends StatelessWidget {
  ProfilePageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBody();
  }
}

// class ProfilePageTab extends StatefulWidget {
//   const ProfilePageTab({super.key});

//   @override
//   State<ProfilePageTab> createState() => _ProfilePageTabState();
// }

// class _ProfilePageTabState extends State<ProfilePageTab> {
//   List _favorites = [];

//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('assets/users.json');
//     final data = await json.decode(response);
//     setState(() {
//       _favorites = data["favorites"];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     readJson();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Profile',
//           style: TextStyle(fontSize: 30),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.settings),
//             iconSize: 30.0,
//             padding: const EdgeInsets.all(25.0),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: SizedBox(
//                         height: 180,
//                         width: 180,
//                         child: Card(
//                           shadowColor: const Color(0xFF586400),
//                           elevation: 8,
//                           clipBehavior: Clip.antiAlias,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(100)),
//                           child: Stack(
//                             children: [
//                               Image.network(
//                                 'https://i.pinimg.com/564x/bd/9e/c3/bd9ec30497867b0bc1c7bc5cf81d0aa2.jpg',
//                                 height: 240,
//                                 fit: BoxFit.cover,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12.0, bottom: 30.0),
//                     child: Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 5.0, horizontal: 50.0),
//                         child: const ProfileInfoWidget(
//                           username: '/elfcmbl',
//                           name: 'Elif',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
//                     child: Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Container(
//                         margin: EdgeInsets.only(left: 50.0, right: 50.0),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 30.0, horizontal: 120.0),
                        
//                       ),
//                       // child: Container(
//                       //   margin: EdgeInsets.only(left: 50.0, right: 50.0),
//                       //   padding: const EdgeInsets.symmetric(
//                       //        vertical: 30.0, horizontal: 120.0),
//                       //   height: 120.0,
//                       //   child: ListView.builder(
//                       //     padding: const EdgeInsets.only(left: 5.0),
//                       //     scrollDirection: Axis.horizontal,
//                       //     itemCount: _favorites.length,
//                       //     itemBuilder: (context, index) {
//                       //       return Padding(
//                       //         padding: const EdgeInsets.all(10.0),
//                       //         child: Column(
//                       //           children: <Widget>[
//                       //             CircleAvatar(
//                       //               radius: 15.0,
//                       //               backgroundImage: NetworkImage(
//                       //                   _favorites[index]["urlAvatar"]),
//                       //             ),
//                       //             const SizedBox(height: 6.0),
                                  
//                       //           ],
//                       //         ),
//                       //       );
//                       //     },
//                       //   ),
//                       // ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12.0, bottom: 80.0),
//                     child: Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Container(
//                         margin: EdgeInsets.only(left: 50.0, right: 50.0),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 100.0, horizontal: 120.0),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ), //profile pic //Name-username
//         ],
//       ),
//     );
//   }
// }

// class ProfileInfoWidget extends StatelessWidget {
//   final String name;
//   final String username;

//   const ProfileInfoWidget({
//     Key? key,
//     required this.name,
//     required this.username,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           name,
//           style: const TextStyle(fontSize: 30),
//           textAlign: TextAlign.center,
//         ),
//         Text(
//           username,
//           style: const TextStyle(fontSize: 15),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
