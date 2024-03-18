
import 'package:flutter/material.dart';

import 'package:quiz_app/screens/admin/category_tab.dart';
import 'package:quiz_app/screens/admin/question_tab.dart';
import 'package:quiz_app/screens/info.dart';

import 'package:shared_preferences/shared_preferences.dart';

class adminPage extends StatelessWidget {
  const adminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
         bottom: TabBar(tabs: [
          Tab(child: Text('Category',style: TextStyle(fontSize: 20),),),
          Tab(child: Text('Question',style: TextStyle(fontSize: 20),),)
         ],labelColor: Colors.white, // Set the color of the selected tab label
              unselectedLabelColor: Colors.grey, // Set the color of unselected tab labels
              indicatorColor: Colors.grey,
         ),
          backgroundColor: Colors.black,
          title: Center(child: Text('AdminPanel',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
          actions: [
            IconButton(onPressed: (){
              
            signout(context);
            }, icon: Icon(Icons.exit_to_app),color: Colors.white,),
            
          ],
        ),
        body: TabBarView(children:[
          CategoryPage(),
         questionTab(),

          ])
        ),
        
      );
    
  }
  void signout(BuildContext context)async{
     final _sharedPrefs = await SharedPreferences.getInstance();
     await _sharedPrefs.clear();
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>infoScreen()), (route) => false);
  }
}