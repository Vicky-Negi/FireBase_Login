import 'package:flutter/material.dart';
import 'package:loginprac/Categry.dart';
import 'package:loginprac/Data.dart';

class AppBars extends StatelessWidget {
  const AppBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        floating: true,
        leadingWidth: 100.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset("assest/ProfilePic/yt_logo_dark.png"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.cast_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 30,
              child: CircleAvatar(
                  foregroundImage: AssetImage('assests/ProfilePic/Mypic.png')),
            ),
          ),
        ]);
  }
}
