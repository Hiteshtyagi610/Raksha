import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vihaan_project/bottom_nav_bar.dart';
import 'package:vihaan_project/resetPasssword.dart';
import 'package:vihaan_project/sign_in_page.dart';
import 'ui_helper.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  loginfxn(String email,String password)async{
            if(email==""&& password==""){
             return uiHelper.customALertBox(context, "Enter the login credential");
            }
        else{
             UserCredential? usercredential;
           try{
                usercredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((Value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
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
          SizedBox(height: 30,),
          uiHelper.customTextfield(passwordController, "Enter Password", Icons.password_sharp, true),
          SizedBox(height: 30,),
          uiHelper.customButton((){
            loginfxn(emailController.text.toString(), passwordController.text.toString());
          }, "Log In"),         
          

      
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("Do not have a account?"),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SigninPage()));
              }, child: Text("Create Account")),
            ],
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Resetpasssword()));
          }, child: Text("Forgot Password?? Reset it Now!!!"))
               
          
        ],
               
       ),
 
       

       );
      
    
  }
}