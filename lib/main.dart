import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vihaan_project/bottom_nav_bar.dart';
import 'package:vihaan_project/firebase_options.dart';
import 'package:vihaan_project/login_page.dart';
import 'user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Fix here!
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget checkCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return BottomNavBar();
    } else {
      return const LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: checkCurrentUser(),
      ),
    );
  }
}
