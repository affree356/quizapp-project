 
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/screens/admin/add_question.dart';

class questionTab extends StatelessWidget {
  questionTab({super.key});

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => addQuestionPage()));
        },
        backgroundColor: Color.fromARGB(255, 39, 38, 38),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('question_db').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                controller: _pageController,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                final quizsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    
                   decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 3,
                        blurRadius: 6,)],
                        color: Colors.white
                   ),
                  
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
                      child: Column(
                        children: [
                          Text(quizsnap['category'],),
                          SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(30,)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(quizsnap['question'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(quizsnap['options'][0],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            )),
                            SizedBox(height: 10,),
                             Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(quizsnap['options'][1],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            )),
                             SizedBox(height: 10,),
                             Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(quizsnap['options'][2],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            )),
                             SizedBox(height: 10,),
                             Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(quizsnap['options'][3],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            )),
                            SizedBox(height: 20,),
                            Text('correct answer is : ${quizsnap['correctanswer'].toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          SizedBox(height: 10,),
                          Text('level :${quizsnap['levels']}',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                    
                   ),
                  
                );
              });
                  
            }
            return Container();
          }),
    );
  }
}   
