import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/admin/add_category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
   final CollectionReference quiz = FirebaseFirestore.instance.collection('quiz');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>addCategory()));
      },backgroundColor: Colors.black,
      child: Icon(Icons.add,color: Colors.white,),
      ),
      body: StreamBuilder(stream: quiz.snapshots() ,
       builder: (context, snapshot) {
         if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
              final DocumentSnapshot quizsnap = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 80,
                 width: double.infinity,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 172, 169, 169),
                  boxShadow: [BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    spreadRadius:2
                  )]
                 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(quizsnap['category'],style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: IconButton(onPressed: (){
                                      
                      }, icon: Icon(Icons.edit),color: Colors.black,),
                    ),
                    IconButton(onPressed: (){
                
                    }, icon: Icon(Icons.delete),color: Color.fromARGB(255, 153, 47, 39),)
                ],
                  )
                ),
              );
          });
         }
         return Container();
       }, ),
    );
  }
}