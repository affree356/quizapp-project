



import 'package:flutter/material.dart';
import 'package:quiz_app/screens/admin/admin_page.dart';
import 'package:quiz_app/screens/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    checkAdminloggedIn(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Color(0xffB81736),
          Color(0xff281537),
        ]
        ),image: DecorationImage(image: AssetImage('assets/Union-removebg-preview.png'))
        ),
      ),
    );
  }

   Future<void>gotoLogin(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
   
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>infoScreen()));
  }

  Future <void> checkAdminloggedIn(BuildContext context)async{

    final _sharedPrefs = await SharedPreferences.getInstance();
    final adminloggedin = _sharedPrefs.getString('login_status');
    if(adminloggedin==null){
      gotoLogin(context);
    }else if(adminloggedin=='admin'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>adminPage()));
    }
   

    

     
  }
}