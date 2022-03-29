import 'package:ezstudy/login_controller.dart';
import 'package:ezstudy/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffE5E8C7),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasData)
            return MainMenu();
          else if (snapshot.hasError)
            return Center(child: Text('Something went wrong!'),);
          else
            return buildLoginButton(h);
        },)
    );
  }

  Container buildLoginButton(h){
    return Container (
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: h/3),
          Text('Ez.Study', 
          style: TextStyle(
            color: Color(0xffD85426),
            fontSize: 50,
            fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 200,),
          FloatingActionButton.extended(
            onPressed: (){
              controller.login();
            },
            icon: Image.asset(
              'assets/images/google_logo.png',
              height: 32,
              width: 32,
            ), 
            label: Text('Sign in with Google'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            )
        ],
      ),
    );
  }


}
