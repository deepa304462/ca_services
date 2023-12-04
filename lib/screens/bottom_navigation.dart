import 'package:ca_services/screens/auth/profile_screen.dart';
import 'package:ca_services/screens/home/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home_page_screen.dart';



class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    NotificationScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        selectedLabelStyle: GoogleFonts.archivo(),
        unselectedLabelStyle: GoogleFonts.archivo(
          color: Colors.grey.shade700,),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
                child: Icon(Icons.home,color: Colors.white,)),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.notifications,color: Colors.white,)),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon:CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person,color: Colors.white,)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

}
