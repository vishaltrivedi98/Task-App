import 'package:flutter/material.dart';
import 'package:task_app/screens/booking.dart';
import 'package:task_app/screens/home.dart';
import 'package:task_app/screens/profile.dart';
import 'package:task_app/screens/setting.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

List<Widget> screens = [
  HomePage(),
  Profilepage(),
  BookingPage(),
  SettingPage()
];

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 4,
        child: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.pink,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'setting',
              ),
              Tab(
                icon: Icon(Icons.watch_later_outlined),
                text: 'wathch',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'person',
              )
            ]),
      ),
      body: screens.elementAt(0),
    );
  }
}
