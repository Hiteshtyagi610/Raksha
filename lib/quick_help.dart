import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vihaan_project/ui_helper.dart';

class QuickHelp extends StatefulWidget {
  const QuickHelp({super.key});

  @override
  State<QuickHelp> createState() => _QuickHelpState();
}

class _QuickHelpState extends State<QuickHelp> {
  final List<String> adImages = [
   'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildNavButton(String title, String url) {
    return ElevatedButton(
      onPressed: () => _launchURL(url),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: uiHelper.customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
                children: [
                  _buildNavButton('Police', 'https://www.google.com/maps/search/police+station+near+me+/'),
                  _buildNavButton('Hospital', 'https://www.google.com/maps/search/hospital+station+near+me+/'),
                  _buildNavButton('Bus Stop', 'https://www.google.com/maps/search/bus+stop+near+me+/'),
                  _buildNavButton('Metro Station', 'https://www.google.com/maps/search/metro+stop+near+me+/'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: uiHelper.carousalSlider(imagePaths: adImages),
            ),
          ],
        ),
      ),
    );
  }
}
