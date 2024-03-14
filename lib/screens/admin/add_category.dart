import 'package:flutter/material.dart';

class addCategory extends StatelessWidget {
  const addCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text('Add Category',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            child: TextField(
              decoration: InputDecoration(
                hintText: '  Enter a category name'
              ),
            ),
            
          ),Padding(
            padding: const EdgeInsets.only(left: 280,top: 30),
            child: Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
              child: TextButton(onPressed: (){
              
              }, child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),
          )
        ],
      ),
    );
  }
}