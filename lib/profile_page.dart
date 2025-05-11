// profile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vihaan_project/ui_helper.dart';
import 'user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';


class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   logout ()async{
 FirebaseAuth.instance.signOut().then((value){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
 });


 }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: uiHelper.customAppBar(),
      body: Container(
           height: double.infinity,
              width: double.infinity,
              color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${userProvider.username}', style: TextStyle(
              fontSize: 40,
              color: Colors.pinkAccent


            ),),
            Text('Email: ${userProvider.email}', style: TextStyle(
              fontSize: 40,
              color: Colors.pinkAccent


            ),),
            SizedBox(height: 150,width: double.infinity,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ ElevatedButton(onPressed:(){ logout();
          
         } , child: Text("Log out", style: TextStyle(
              fontSize: 20,
              color: Colors.pinkAccent


            ),))],
            )
          ],
          
        ),
      ),
    );
  }
}

