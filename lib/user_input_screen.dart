// user_info_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vihaan_project/bottom_nav_bar.dart';
import 'user_provider.dart';
import 'ui_helper.dart';
class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contact1Controller = TextEditingController();
  final _contact2Controller = TextEditingController();
  final _contact3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: uiHelper.customAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            uiHelper.customTextfield(_usernameController, "username", Icons.verified_user_outlined, false),
            uiHelper.customTextfield(_emailController, "username", Icons.verified_user_outlined, false),
            uiHelper.customTextfield(_contact1Controller, "username", Icons.verified_user_outlined, false),
            uiHelper.customTextfield(_contact2Controller, "username", Icons.verified_user_outlined, false),
            uiHelper.customTextfield(_contact3Controller, "username", Icons.verified_user_outlined, false),
      
            //TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
            //TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            //TextField(controller: _contact1Controller, decoration: InputDecoration(labelText: 'Emergency Contact 1')),
            //TextField(controller: _contact2Controller, decoration: InputDecoration(labelText: 'Emergency Contact 2')),
            //TextField(controller: _contact3Controller, decoration: InputDecoration(labelText: 'Emergency Contact 3',)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).setUserData(
                  _usernameController.text,
                  _emailController.text,
                  [
                    _contact1Controller.text,
                    _contact2Controller.text,
                    _contact3Controller.text,
                  ],
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavBar()),
                );
              },
              child: Text('Submit & Go to app'),
            ),
          ],
        ),
      ),
    );
  }
}
