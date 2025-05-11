import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:vihaan_project/user_input_screen.dart';

import 'ui_helper.dart';
import 'bottom_nav_bar.dart';
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
    TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
   signInfxn(String email,String password)async{
            if(email==""&& password==""){
              uiHelper.customALertBox(context, "Enter the login credential");
            }
        else{
             UserCredential? usercredential;
           try{
                usercredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, password: password).then((Value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserInfoPage()));
                });

           }
               on FirebaseAuthException catch(ex){
                return uiHelper.customALertBox(context, ex.code.toString());
               }
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: uiHelper.customAppBar(),
    body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login Here for Raksha", style: TextStyle(fontSize: 40),),
          uiHelper.customTextfield(emailController, "Enter Email", Icons.email, false),
          uiHelper.customTextfield(passwordController, "Enter Password", Icons.password_sharp, true),
          SizedBox(height: 30,),
          uiHelper.customButton((){
            signInfxn(emailController.text.toString(), passwordController.text.toString());
          }, "Sign In")          
                  ],
       ),
    );
  }
}