import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userCategory extends StatelessWidget {
   userCategory({super.key});
 final CollectionReference quiz = FirebaseFirestore.instance.collection('quiz');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
             height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffB81736),
                  Color(0xff281537),
                ],
              ),
            ),
            child: StreamBuilder(
              stream: quiz.snapshots(), 
            builder: (context,snapshot){
              if(snapshot.hasData){  
               return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                
               ),
               itemCount: snapshot.data!.docs.length, 
               itemBuilder:(context,index){
                final quizsnap = snapshot.data!.docs[index];
               return Card(
                color:  Colors.transparent,
                child: Center(child: Text(quizsnap['category'],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)));
                
               } ,
              
               );
              }return Container();
            },
            ),
          ))
        ],
      ),
      
    );
  }
 
}
// final quizsnap = snapshot.data!.docs[index];
//                 return Text(quizsnap['category']);