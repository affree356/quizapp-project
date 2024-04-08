
import 'package:flutter/material.dart';

import 'package:quiz_app/screens/admin/category_tab.dart';
import 'package:quiz_app/screens/admin/question_list.dart';

import 'package:quiz_app/screens/info.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

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
        const  CategoryPage(),
        QuestionList()
       

          ])
        ),
        
      );
    
  }
  void signout(BuildContext context)async{
    
     final _sharedPrefs = await SharedPreferences.getInstance();
     await _sharedPrefs.clear();
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (ctx1) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Do you want to exit the app'),
            actions: [
              TextButton(
                  onPressed: () {
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const infoScreen()), (route) => false);
                  },
                  child: const Text('yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
    
  }

}