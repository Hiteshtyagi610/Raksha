import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vihaan_project/ui_helper.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({super.key});

  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return null;
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> _openMaps() async {
    final position = await _getCurrentLocation();
    if (position == null) return;

    final googleMapsUrl =
        'https://www.google.com/maps?q=${position.latitude},${position.longitude}';

    if (kIsWeb) {
      await launchUrl(Uri.parse(googleMapsUrl),
          mode: LaunchMode.platformDefault);
    } else {
      await launchUrl(Uri.parse(googleMapsUrl),
          mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _shareLocation() async {
    final position = await _getCurrentLocation();
    if (position == null) return;

    final googleMapsUrl =
        'https://www.google.com/maps?q=${position.latitude},${position.longitude}';

    final message =
        "📍 I'm here: $googleMapsUrl\nSent from my Women Safety App.";

    await Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: uiHelper.customAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  uiHelper.customButton((){_openMaps();}, "Open in Google Maps"),
                      const SizedBox(height: 50),
                  uiHelper.customButton((){_shareLocation();}, "Share My Location"),


           
          ],
        ),
      ),
    );
  }
}
