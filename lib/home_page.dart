import 'package:flutter/material.dart';
import 'ui_helper.dart';
import 'sos_contact_page.dart';
import 'cab_booking_page.dart';
import 'quick_help.dart';
import 'live_location.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> adImages = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
         appBar: uiHelper.customAppBar(),
        body: SingleChildScrollView(
  child: Column(
    children: [
    
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
          children: [
            buildButton('SOS Contacts', Icons.sos, Colors.pinkAccent, context, SosContactPage()),
            buildButton('Cab', Icons.local_taxi, Colors.pinkAccent, context, CabBookingPage()),
            buildButton('Quick Help', Icons.quick_contacts_dialer, Colors.pinkAccent, context, QuickHelp()),
            buildButton('Live Location', Icons.gps_fixed, Colors.pinkAccent, context, LiveLocation()),
          ],
        ),
      ),

            Padding(
        padding: const EdgeInsets.all(8.0),
        child: uiHelper.carousalSlider(imagePaths: adImages),
         
      ),
    ],
  ),
),

         
        
    );
  }
}

 Widget buildButton(String label, IconData icon, Color color, BuildContext context, Widget navigateTo) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigateTo),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}
