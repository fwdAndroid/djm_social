import 'package:djm_social/screens/pages/call.dart';
import 'package:djm_social/screens/pages/contact_page.dart';
import 'package:djm_social/screens/pages/message.dart';
import 'package:djm_social/screens/pages/setting_page.dart';
import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Message(), // Replace with your screen widgets
    CallPage(),
    ContactPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white,
        selectedItemColor: navColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "Messages",
              icon: _currentIndex == 0
                  ? Icon(
                      Icons.chat,
                      color: navColor,
                    )
                  : Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: "Calls",
              icon: _currentIndex == 1
                  ? Icon(
                      Icons.call,
                      color: navColor,
                    )
                  : Icon(Icons.call)),
          BottomNavigationBarItem(
              label: "Contacts",
              icon: _currentIndex == 2
                  ? Icon(
                      Icons.contact_page,
                      color: navColor,
                    )
                  : Icon(Icons.contact_page)),
          BottomNavigationBarItem(
              label: "Settings",
              icon: _currentIndex == 2
                  ? Icon(
                      Icons.settings,
                      color: navColor,
                    )
                  : Icon(Icons.settings)),
        ],
      ),
    );
  }
}
