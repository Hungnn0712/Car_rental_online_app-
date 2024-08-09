
import 'package:app_car_rental/screen/history.dart';
import 'package:app_car_rental/screen/home_page.dart';
import 'package:app_car_rental/screen/login.dart';
import 'package:app_car_rental/screen/notification_page.dart';
import 'package:app_car_rental/screen/pagepersonal.dart';
import 'package:app_car_rental/screen/suport_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final List<Widget> _pages = [
    const HomePage(),
    NotificationPage(),
    History(uid: 'VASyEU2KqBc4QiyAYPRGruyMCOH2',),
    const SuportPage(),
    const Pagepersonal(),
    const Loginpage(fromPage: null, proId: null),
  ];
  bool checkLogin () {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null)
      {
        return true;
      }
    else {return  false;}
  }
  void _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 4) { // Check if Profile icon is tapped
        if (!checkLogin()) { // If not logged in
          Navigator.push( // Navigate to login page
            context,
            MaterialPageRoute(builder: (context) => Loginpage(fromPage: null, proId: null)),
          );
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông Báo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash),
              label: 'Lịch Sử'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_support),
              label: 'Hỗ Trợ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(dart_green),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
