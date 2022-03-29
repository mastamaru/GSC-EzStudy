import 'package:ezstudy/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

Container MainMenu(){
  final user = FirebaseAuth.instance.currentUser!;
  final controller = Get.put(LoginController());
  var date = DateTime.now();

  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children:[
        SizedBox(height:45),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: Image.network(user.photoURL!).image,
              radius: 30,
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 25, color:  Color(0xff43516C)),
                  ),
                Text(
                  user.displayName!,
                  style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 25, color:  Color(0xffD85426))
                  ),
              ]
            ),
            SizedBox(width: 110,),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: (){}, 
              icon: Image.asset('assets/images/ci_settings-filled.png',),
              iconSize: 35,
                )
          ]
        ),
        SizedBox(height: 10),
        Text(
          DateFormat('EEEE, d MMM yyyy').format(date),
          style: TextStyle(
          fontSize: 20, 
          color:  Color(0xff43516C))
        ),
        SizedBox(height: 10),
        Divider(
          color: Color(0xff43516C),
          height: 20,
          thickness: 2,
          indent: 0,
          endIndent: 0,
          ),
          // ActionChip(
          //   avatar: Icon(Icons.logout),
          //   label: Text('Logout'),
          //   onPressed: () {
          //     controller.logout();
          //   })
        SizedBox(height: 3),
        Row(
          children: [
            Text(
              'Task to do',
              style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 25, color:  Color(0xff43516C)),
            ),
            SizedBox(width: 20,),
            Image.asset(
              'assets/images/ic_round-arrow-drop-down.png', 
              height: 20,)
          ],
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: 70,
          child: ElevatedButton(
            onPressed: (){}, 
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0), 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15), 
                    child: Image.asset(
                      'assets/images/Ellipse.png',
                      height: 15,
                      ),
                    ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Physics',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 25, color:  Color(0xff43516C)),
                      ),
                      Text(
                        'Homework #2 energy and forces',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 15, color:  Color(0xff43516C)),
                      ),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                    'Deadline',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 12, color:  Color(0xff06659F)),
                      ),
                    )
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xffe2c39f),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
            ),
          ),
        )
      ]
    ),
  );
}


// Container Maklodzaky(){
//   List<DropdownMenuItem<String>> get dropdownItems{
//   List<DropdownMenuItem<String>> menuItems = [
//     DropdownMenuItem(child: Text("USA"),value: "USA"),
//     DropdownMenuItem(child: Text("Canada"),value: "Canada"),
//     DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
//     DropdownMenuItem(child: Text("England"),value: "England"),
//   ];
//   return menuItems;
// }
// }
