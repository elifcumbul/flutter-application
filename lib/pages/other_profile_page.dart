import 'package:flutter/material.dart';

import 'components/other_profile_comp/other_profile_body.dart';

class OtherProfilePage extends StatelessWidget {
  final String profileKey;
  const OtherProfilePage({required this.profileKey});


  @override
  Widget build(BuildContext context) {
    return OtherProfileBody(profileKey: profileKey,);
  }
 }