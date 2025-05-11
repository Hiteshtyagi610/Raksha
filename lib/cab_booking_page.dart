import 'package:flutter/material.dart';
import 'package:vihaan_project/ui_helper.dart';

class CabBookingPage extends StatelessWidget {
  const CabBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: uiHelper.customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_taxi,
                size: 100,
                color: Colors.pinkAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                "Book a Women-Driver Cab",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "For enhanced safety and comfort,\nyou can book a cab driven by a trusted\nwomen driver in your area.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // Currently non-functional
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          "Cab booking feature coming soon. Stay safe!"),
                    ),
                  );
                },
                icon: const Icon(Icons.car_rental),
                label: const Text("Book Now"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
