import 'package:flutter/material.dart';
import '../home_page.dart';
import '../profile_page.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Widget> pages =[
    HomePage(),
    // DangerZonePage(),
    // SosContactPage(),
    // CabBookingPage(),  
    ProfilePage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.pinkAccent,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(icon: Icon(Icons.dangerous), label: 'Danger Zone'),
          // BottomNavigationBarItem(icon: Icon(Icons.sos), label: 'SOS Contacts'),
          // BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Book Cab'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
        









    );
  }
}




