import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/info.dart';
import 'package:quiz_app/screens/user/user_login.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Color(0xffB81736),
          Color(0xff281537),
        ],
         ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,),
              child: PopupMenuButton(itemBuilder: (context)=>
                [PopupMenuItem(child:GestureDetector(
                  onTap: (){
                     FirebaseAuth.instance.signOut();
             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>infoScreen()));
                  },
                  child: Text('logout')),
                value: Text('logout'),
                )]
              ),
            )
          ],
        ),
      )
    );
  }
}