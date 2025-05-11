import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vihaan_project/login_page.dart';
import 'package:vihaan_project/ui_helper.dart';

class Resetpasssword extends StatefulWidget {
  const Resetpasssword({super.key});

  @override
  State<Resetpasssword> createState() => _ResetpassswordState();
}

class _ResetpassswordState extends State<Resetpasssword> {
  TextEditingController emailController =TextEditingController();
  forgotPassword(String email){
    if(email==""){
      return uiHelper.customALertBox(context,"Enter Email");
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: uiHelper.customAppBar(),
           body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  uiHelper.customTextfield(emailController, "Enter Email", Icons.email, false),
                      uiHelper.customButton((){forgotPassword(emailController.text.toString());}, "Reset Password"),
                      uiHelper.customButton((){Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>LoginPage()));
                      }, "Login with new password")

                ],

           ),





    );
  }
}