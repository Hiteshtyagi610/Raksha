// sos_contact_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vihaan_project/ui_helper.dart';
import 'user_provider.dart';

class SosContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contacts = Provider.of<UserProvider>(context).emergencyContacts;
    return Scaffold(
      appBar: uiHelper.customAppBar(),
      body: Container(
           height: double.infinity,
              width: double.infinity,
              color: Colors.black,
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('Contact ${index + 1}: ${contacts[index]}', style: TextStyle(
              fontSize: 40,
              color: Colors.pinkAccent


            ),),
          ),
        ),
      ),
    );
  }
}
